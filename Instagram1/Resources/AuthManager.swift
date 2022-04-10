//
//  AuthManager.swift
//  Instagram1
//
//  Created by Touri Said on 27/03/2022.
//

import FirebaseAuth

public class AuthManager {

    static let shared = AuthManager()

    //Mark: - Public

    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
/*
 - Check if username is available
 - Check if email is available
 - Create Account
 - Insert Account to Database
 */


        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                /* - Create account
                   - Insert account to Database
                 */
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else {
                        // Firebase could not create account
                        completion(false)
                        return
                    }

                    // Insert to databse
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        }
                        else {
                            // failed to insert into database
                            completion(false)
                            return
                        }
                    }

                }
            }
            else {
                // either username or email does not exist
                completion(false)
            }
        }
    }

    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            // Email Log in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }

                completion(true)
            }
        }
        else if let username = username {
            // Username Log In
            print(username)
        }
    }

    /// Attempt to log out firebase user
    
    public func logOut(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        }
        catch {
            print(error)
            completion(false)
            return
        }
    }
}
