//
//  ContentView.swift
//  PasswordManager
//
//  Created by Brandon Le on 4/29/21.
//
import SwiftUI

struct ContentView: View {
    @State private var db = Database.getInstance()
    @State var userList = Database.getAllUsers()
    @State private var title: String = ""
    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var title2 : String = "" // separate title var for account deletion
 
    init(){
        UITabBar.appearance().barTintColor = .systemBackground
    }
    var body: some View {
        Text("Password Manager").bold().padding(10)
        TabView(){
            // UI for listing database rows
            List(userList){ u in
                VStack(alignment:.leading){
                    Text("Title: \(u.title)")
                    Text("Username: \(u.userName)")
                    Text("Password: \(u.password)")
                }
            }
            .tabItem{
                Text("List Accounts")
            }
            
            VStack{ // UI for entering account information
                TextField("Enter title", text:$title)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                TextField("Enter username", text:$userName)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                TextField("Enter password", text:$password)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                    .autocapitalization(.none)
                    .disableAutocorrection(false)
                Button(action: { // Add account title, username, and password
                    Database.addUser(t: title, u: userName, p: password)
                    title = ""
                    userName=""
                    password=""
                    userList = Database.getAllUsers()
                }, label: {
                    Text("Add Account")
                })
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                Button(action: { // Generates random password
                    let randomChar = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%?^&*"
                    let len = 10
                    
                    // chooses 8 random characters from randomChar array for password
                    password = String((0..<len).compactMap {
                        _ in randomChar.randomElement()
                    })
                }, label: {
                    Text("Generate Password")
                })
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
            }.padding(10)
            .tabItem{
                Text("Create Account")
            }
            // UI for deleting an account from SQLite database via title
            VStack{
                TextField("Enter title", text:$title2)
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(5)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                Button(action:{
                    Database.deleteUser(t: title2)
                    userList = Database.getAllUsers()
                    title2 = ""
                }, label:{
                    Text("Delete")
                })
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 10)
                .padding(.bottom, 10)
            }.padding(10)
            .tabItem{
                Text("Delete Account")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
