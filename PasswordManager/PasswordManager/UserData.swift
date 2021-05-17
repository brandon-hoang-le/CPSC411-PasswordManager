//
//  UserData.swift
//  PasswordManager
//
//  Created by Brandon Le on 5/5/21.
//

import Foundation
import SQLite


class Database{
    static private let dbname = "users"
    static private var db : Connection? = nil
    static private var users: Table!
    static private let title = Expression<String>("Title")
    static private let id = Expression<Int>("ID")
    static private let userName = Expression<String>("Username")
    static private let password = Expression<String>("Password")
    
    static func getInstance() -> Connection {
        if (db == nil){
            // creates SQLite database in IPhone
            let dbPath = try! FileManager.default.url(for: .documentDirectory, in:.userDomainMask, appropriateFor: nil, create:false).appendingPathComponent(dbname).appendingPathExtension("sqlite3").path
            db = try! Connection(dbPath)
            createTables()
        }
        return db!
    }
    static func createTables() {
        users = Table("finalUserData")
        let ctCmd = users.create (ifNotExists: true) { t in
            t.column(title)
            t.column(id, primaryKey: true)
            t.column(userName)
            t.column(password)
            
        }
        try! db!.run(ctCmd)
    }
    static func addUser(t:String, u:String, p:String){
        let insert = users.insert(title <- t, userName <- u, password <- p)
        do {
            try db!.run(insert)
        }
        catch {
            print(error)
        }
    }
    static func getAllUsers() -> [UserItem] {
        var userList = [UserItem]()
        do {
            for user in try db!.prepare(users){
                userList.append(UserItem(title: user[title],id: user[id], userName: user[userName], password: user[password]))
            }
            
        }
        catch{
            print(error)
        }
        return userList
        
    }
    static func deleteUser(t:String){
        let user = users.filter(title == t)
        let deleteUser = user.delete()
        do{
            try db!.run(deleteUser)
        }
        catch {
            print(error)
        }
    }
}
struct UserItem: Identifiable { // User Account Data Object
    let title : String
    let id : Int
    let userName : String
    let password : String
}



