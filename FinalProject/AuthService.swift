//
//  AuthService.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 16.12.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService{
    public static let shared = AuthService()
    
    private init(){}
    
    
    /// Method to register a user
    /// - Parameters:
    ///   - userRequest: The users information
    ///   - completion: A completion with two values
    ///   - Bool: wasRegistered - Determines if the user was registered and saved in the database correctly
    ///   - Error: Optional error of Firebase
    public func registerUser(with userRequest: RegisterUserRequest, completion: @escaping (Bool, Error?) -> Void){
        let username = userRequest.username
        let email = userRequest.email
        let password = userRequest.password
        
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error{
                completion(false, error)
                return
            }
            
            guard let resultUser = result?.user else{
                completion(false, nil)
                return
            }
            
            let db = FirebaseFirestore.Firestore.firestore()
            db.collection("users").document(resultUser.uid).setData([
                "username": username,
                "email": email
            ]) { error in
                if let error = error{
                    completion(false, error)
                    return
                }
                
                completion(true, nil)
            }
            
        }
    }
    
    public func signIn(with userRequest: LoginUserRequest, completion: @escaping (Error?)->Void) {
            Auth.auth().signIn(
                withEmail: userRequest.email,
                password: userRequest.password
            ) { result, error in
                if let error = error {
                    completion(error)
                    return
                } else {
                    completion(nil)
                }
            }
    }
    
    public func logout(completion: @escaping (Error?) -> Void){
        do{
            try Auth.auth().signOut()
            completion(nil)
        }catch let error{
            completion(error)
        }
        
    }
}
