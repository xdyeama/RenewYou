//
//  LoginUserModel.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 18.12.2023.
//

import Foundation


struct LoginUserRequest{
    let email: String
    let password: String
}

struct RegisterUserRequest {
    let username: String
    let email: String
    let password: String
}

struct User{
    let username: String
    let email: String
    let userUID: String
}
