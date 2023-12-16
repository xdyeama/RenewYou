//
//  LoginViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 14.12.2023.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {

    private let headerView = AuthHeaderView(title: "Sign in", subTitle: "Signin into your account")
    
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)

    private let loginButton = CustomButton(title: "Login", hasBackground: true, fontSize: .big)
    private let newUserButton = CustomButton(title: "New user? Create account.", fontSize: .medium)
    private let forgotPassButton = CustomButton(title: "Forgot password?", fontSize: .small)
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        self.newUserButton.addTarget(self, action: #selector(didTapNewUser), for: .touchUpInside)
        self.forgotPassButton.addTarget(self, action: #selector(didTapForgotPass), for: .touchUpInside)
    }
    
    private func setupUI(){
        self.view.addSubview(headerView)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(loginButton)
        self.view.addSubview(newUserButton)
        self.view.addSubview(forgotPassButton)

        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        newUserButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPassButton.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.snp.makeConstraints{ maker in
            maker.top.equalTo(self.view.layoutMarginsGuide.snp.top)
            maker.leading.equalTo(self.view.snp.leading)
            maker.trailing.equalTo(self.view.snp.trailing)
            maker.height.equalTo(222)
            maker.centerX.equalTo(self.view.snp.centerX)
        }
        
        emailField.snp.makeConstraints{ maker in
            maker.top.equalTo(headerView.snp.bottom).offset(12)
            maker.height.equalTo(55)
            maker.width.equalTo(self.view.snp.width).multipliedBy(0.85)
            maker.centerX.equalTo(headerView.snp.centerX)
        }
        
        passwordField.snp.makeConstraints{ maker in
            maker.top.equalTo(emailField.snp.bottom).offset(22)
            maker.height.equalTo(55)
            maker.width.equalTo(self.view.snp.width).multipliedBy(0.85)
            maker.centerX.equalTo(emailField.snp.centerX)
        }
        
        loginButton.snp.makeConstraints{ maker in
            maker.top.equalTo(passwordField.snp.bottom).offset(22)
            maker.height.equalTo(55)
            maker.width.equalTo(self.view.snp.width).multipliedBy(0.85)
            maker.centerX.equalTo(emailField.snp.centerX)
        }
        
        newUserButton.snp.makeConstraints{ maker in
            maker.top.equalTo(loginButton.snp.bottom).offset(11)
            maker.height.equalTo(44)
            maker.width.equalTo(self.view.snp.width).multipliedBy(0.85)
            maker.centerX.equalTo(loginButton.snp.centerX)
        }
        
        forgotPassButton.snp.makeConstraints{ maker in
            maker.top.equalTo(newUserButton.snp.bottom).offset(6)
            maker.height.equalTo(44)
            maker.width.equalTo(self.view.snp.width).multipliedBy(0.85)
            maker.centerX.equalTo(newUserButton.snp.centerX)
        }
    }
    
    // MARK: -- Selectors
    
    @objc func didTapLogin(){
        let loginReq: LoginUserRequest = LoginUserRequest(email: self.emailField.text ?? "", password: self.passwordField.text ?? "")
        
        if !Validator.isValidEmail(for: loginReq.email){
            print(loginReq.email)
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        if !Validator.isValidPassword(for: loginReq.password){
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthService.shared.signIn(with: loginReq) { [weak self] error in
            guard let self = self else { return }
            if let error = error{
                AlertManager.showLoginErrorAlert(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate{
                sceneDelegate.validateAuth()
            }else{
                AlertManager.showLoginErrorAlert(on: self)
            }
        }
        
        
    }
    
    @objc func didTapNewUser(){
        let vc = RegViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapForgotPass(){
        let vc = ForgotPassViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }


}
