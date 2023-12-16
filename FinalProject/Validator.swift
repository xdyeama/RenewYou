//
//  ValidationService.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 16.12.2023.
//

import Foundation


class Validator{
    static func isValidEmail(for email: String) -> Bool{
        let email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let regexPattern = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.{1}[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", regexPattern)
        return emailPred.evaluate(with: email)
    }
    
    static func isValidUsername(for username: String) -> Bool{
        let username = username.trimmingCharacters(in: .whitespacesAndNewlines)
        let regexPattern = "\\w{4,24}"
        let usernamePred = NSPredicate(format: "SELF MATCHES %@", regexPattern)
        return usernamePred.evaluate(with: username)
    }
    
    static func isValidPassword(for password: String) -> Bool{
        let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let regexPattern = "^(?=.*[a-z])(?=.*[0-9])(?=.$[$@$#!%*?&]).{6,32}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", regexPattern)
        return passwordPred.evaluate(with: password)
    }
}

