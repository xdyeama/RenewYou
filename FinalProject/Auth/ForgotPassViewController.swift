//
//  ForgotPassViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 14.12.2023.
//

import UIKit

class ForgotPassViewController: UIViewController {
    private let headerView = AuthHeaderView(title: "Forgot Password", subTitle: "Reset your password")
    private let emailField = CustomTextField(fieldType: .email)
    private let resetPassButton = CustomButton(title: "Reset", hasBackground: true, fontSize: .big)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.resetPassButton.addTarget(self, action: #selector(didTapResetPass), for: .touchUpInside)
    }
    
    private func setupUI(){
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(headerView)
        self.view.addSubview(emailField)
        self.view.addSubview(resetPassButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        resetPassButton.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        resetPassButton.snp.makeConstraints{ maker in
            maker.top.equalTo(emailField.snp.bottom).offset(22)
            maker.height.equalTo(55)
            maker.width.equalTo(self.view.snp.width).multipliedBy(0.85)
            maker.centerX.equalTo(emailField.snp.centerX)
        }
        
    }
    
    @objc private func didTapResetPass(){
        guard let email = self.emailField.text, !email.isEmpty else{
            return
        }
        
    }


}
