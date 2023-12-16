//
//  AuthService.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 16.12.2023.
//

import Foundation
import FirebaseAuth

class AuthService{
    public static let shared = AuthService()
    
    private init(){}
    
    public func registerUser(with userRequest: RegisterUserRequest, completion: @escaping (Bool, Error?) -> Void){
        
    }
}
