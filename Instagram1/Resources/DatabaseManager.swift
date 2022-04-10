//
//  DatabaseManager.swift
//  Instagram1
//
//  Created by Touri Said on 27/03/2022.
//

import FirebaseDatabase

public class DatabaseManager {

    static let shared = DatabaseManager()

    private let database = Database.database().reference()

    //Mark: - Public

    /// Check if username and email is available
    ///  - Parameters
    ///         - email: String representating email
    ///         - username: String representating username
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }

    /// Insert new Users to databse
    ///  - Parameters
    ///         - email: String representating email
    ///         - username: String representating username
    ///         - completion: Async callback for result if database entry succeeded
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        let key = email.safeDatabaseKey()
        database.child(key).setValue(["username": username]) { error, _ in
            if error == nil {
                // succeeded
                completion(true)
                return
            }
            else {
                // failed
                completion(false)
                return
            }
        }
    }
}
