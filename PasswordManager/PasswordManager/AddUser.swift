//
//  AddUser.swift
//  PasswordManager
//
//  Created by Brandon Le on 5/5/21.
//

import SwiftUI

struct AddUser: View {
    @State private var userName: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack{
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
            Button(action: {
                Database.addUser(u: userName, p: password)
            }, label: {
                Text("AddUser")
            })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.top, 10)
                .padding(.bottom, 10)
        }.padding()
    }
}

struct AddUser_Previews: PreviewProvider {
    static var previews: some View {
        AddUser()
    }
}
