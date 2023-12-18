//
//  RegViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 14.12.2023.
//

import UIKit

class RegViewController: UIViewController {
    private let headerView = AuthHeaderView(title: "Register", subTitle: "Create your account")
    
    private let usernameField = CustomTextField(fieldType: .username)
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    
    private let registerButton = CustomButton(title: "Register", hasBackground: true, fontSize: .big)
    private let loginButton = CustomButton(title: "Already have an account?", fontSize: .medium)
    
    private let termsTextView: UITextView = {
        let tv = UITextView()
        let attrString = NSMutableAttributedString(string: "By creating an account, you agree to our Terms & Conditions and you acknowledge our Privacy Policy")
        attrString.addAttribute(.link, value: "terms://termsAndConditions", range: (attrString.string as NSString).range(of: "Terms & Conditions"))
        
        attrString.addAttribute(.link, value: "privacy://privacyPolicy", range: (attrString.string as NSString).range(of: "Privacy Policy"))
        
        tv.linkTextAttributes = [.foregroundColor: UIColor.systemBlue,]
        tv.textAlignment = .center
        tv.backgroundColor = .clear
        tv.attributedText = attrString
        tv.textColor = .label
        tv.isSelectable = true
        tv.isEditable = false
        tv.delaysContentTouches = false
        tv.isScrollEnabled = false
        return tv
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        
//        self.didTapNewUser()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.termsTextView.delegate = self
        
        self.registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        self.loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        
    }
    
    private func setupUI(){
        self.view.addSubview(headerView)
        self.view.addSubview(usernameField)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(registerButton)
        self.view.addSubview(termsTextView)
        self.view.addSubview(loginButton)

        self.headerView.translatesAutoresizingMaskIntoConstraints = false
        self.usernameField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordField.translatesAutoresizingMaskIntoConstraints = false
        self.termsTextView.translatesAutoresizingMaskIntoConstraints = false
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false
        self.registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.snp.makeConstraints{ maker in
            maker.top.equalTo(self.view.layoutMarginsGuide.snp.top)
            maker.leading.equalTo(self.view.snp.leading)
            maker.trailing.equalTo(self.view.snp.trailing)
            maker.height.equalTo(222)
            maker.centerX.equalTo(self.view.snp.centerX)
        }
        
        usernameField.snp.makeConstraints{ maker in
            maker.top.equalTo(headerView.snp.bottom).offset(12)
            maker.height.equalTo(55)
            maker.width.equalTo(self.view.snp.width).multipliedBy(0.85)
            maker.centerX.equalTo(headerView.snp.centerX)
        }
        
        emailField.snp.makeConstraints{ maker in
            maker.top.equalTo(usernameField.snp.bottom).offset(12)
            maker.height.equalTo(55)
            maker.width.equalTo(self.view.snp.width).multipliedBy(0.85)
            maker.centerX.equalTo(headerView.snp.centerX)
        }
        
        passwordField.snp.makeConstraints{ maker in
            maker.top.equalTo(emailField.snp.bottom).offset(22)
            maker.height.equalTo(55)
            maker.width.equalTo(self.view.snp.width).multipliedBy(0.85)
            maker.centerX.equalTo(usernameField.snp.centerX)
        }
        
        registerButton.snp.makeConstraints{ maker in
            maker.top.equalTo(passwordField.snp.bottom).offset(22)
            maker.height.equalTo(55)
            maker.width.equalTo(self.view.snp.width).multipliedBy(0.85)
            maker.centerX.equalTo(usernameField.snp.centerX)
        }
        
        termsTextView.snp.makeConstraints{ maker in
            maker.top.equalTo(registerButton.snp.bottom).offset(11)
            maker.height.equalTo(44)
            maker.width.equalTo(self.view.snp.width).multipliedBy(0.85)
            maker.centerX.equalTo(registerButton.snp.centerX)
        }
        
        loginButton.snp.makeConstraints{ maker in
            maker.top.equalTo(termsTextView.snp.bottom).offset(11)
            maker.height.equalTo(44)
            maker.width.equalTo(self.view.snp.width).multipliedBy(0.85)
            maker.centerX.equalTo(registerButton.snp.centerX)
        }
    }
    
    // MARK: -- Selectors
    
    @objc func didTapRegister(){
        print("login is \(self.emailField.text)")
        print("Password is \(self.passwordField.text)")
        let registerReq = RegisterUserRequest(username: self.usernameField.text ?? "", email: self.emailField.text ?? "", password: self.passwordField.text ?? "")
        if !Validator.isValidUsername(for: registerReq.username){
            AlertManager.showInvalidUsernameAlert(on: self)
            return
        }
        if !Validator.isValidEmail(for: registerReq.email){
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        if !Validator.isValidPassword(for: registerReq.password){
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        AuthService.shared.registerUser(with: registerReq) { [weak self] wasRegistered, error in
                    guard let self = self else { return }
                    
                    if let error = error {
                        AlertManager.showRegErrorAlert(on: self, with: error)
                        return
                    }
                    
                    if wasRegistered {
                        if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                            sceneDelegate.validateAuth()
                        }
                    } else {
                        AlertManager.showRegErrorAlert(on: self)
                    }
                }
    }
    
    @objc func didTapLogin(){
        self.navigationController?.popViewController(animated: true)
    }
}


extension RegViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        if URL.scheme == "terms"{
            self.showWebViewerController(with: "https://policies.google.com/terms?hl=en-US")
        }else if URL.scheme == "privacy"{
            self.showWebViewerController(with: "https://policies.google.com/privacy?hl=en-US")
        }
        return true
    }
    
    private func showWebViewerController(with urlString: String) {
        let vc = WebViewerController(with: urlString)
        let nav = UINavigationController(rootViewController: vc)
        
        self.present(nav, animated: true, completion: nil)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        textView.delegate = nil
        textView.selectedTextRange = nil
        textView.delegate = self
    }
}
