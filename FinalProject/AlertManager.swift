//
//  AlertManager.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 15.12.2023.
//

import UIKit

class AlertManager{
    private static func showBasicAlert(on vc: UIViewController, title: String,message: String?){
        DispatchQueue.main.async{
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: title, style: .default, handler: nil))
            
            vc.present(alert, animated: true, completion: nil)
        }
    }
}


// MARK: Login error alert
extension AlertManager{
    public static func showInvalidEmailAlert(on vc: UIViewController){
        self.showBasicAlert(on: vc, title: "Invalid Email", message: "Please enter a valid email")
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController){
        self.showBasicAlert(on: vc, title: "Invalid Password", message: "Please enter a valid password")
    }
    
    public static func showInvalidUsernameAlert(on vc: UIViewController){
        self.showBasicAlert(on: vc, title: "Invalid Username", message: "Please enter a valid username")
    }
}


// MARK: Registration error alert

extension AlertManager{
    public static func showRegErrorAlert(on vc: UIViewController){
        self.showBasicAlert(on: vc, title: "Uknown registration error", message: nil)
    }
    
    public static func showRegErrorAlert(on vc: UIViewController, with error: Error){
        self.showBasicAlert(on: vc, title: "Uknown registration error", message: "\(error.localizedDescription)")
    }
}

// MARK: Login error alert
extension AlertManager{
    public static func showLoginErrorAlert(on vc: UIViewController){
        self.showBasicAlert(on: vc, title: "Unknown login error", message: nil)
    }
    
    public static func showLoginErrorAlert(on vc: UIViewController, with error: Error){
        self.showBasicAlert(on: vc, title: "Unknown login error", message: "\(error.localizedDescription)")
    }
}

// MARK: Logout error alert
extension AlertManager{

    public static func showLogoutErrorAlert(on vc: UIViewController, with error: Error){
        self.showBasicAlert(on: vc, title: "logout error", message: "\(error.localizedDescription)")
    }
}

// MARK: Forgot password error alert
extension AlertManager{

    public static func passResetSent(on vc: UIViewController){
        self.showBasicAlert(on: vc, title: "Password reset sent", message: nil)
    }
    
    public static func showForgotPassErrorAlert(on vc: UIViewController, with error: Error){
        self.showBasicAlert(on: vc, title: "Error sending password reset", message: "\(error.localizedDescription)")
    }
}

// MARK: Show fetching user error

extension AlertManager{
    public static func showFetchingError(on vc: UIViewController, with error: Error){
        self.showBasicAlert(on: vc, title: "Error while fetching data", message: "\(error.localizedDescription)")
    }
    public static func showUnknownFetchingError(on vc: UIViewController){
        self.showBasicAlert(on: vc, title: "Error while fetching data", message: nil)
    }
}
