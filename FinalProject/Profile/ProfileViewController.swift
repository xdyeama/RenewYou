//
//  ProfileViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 27.11.2023.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    let label = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
        setupLayout()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(didTapLogout))
        
    }
    
    func setupLayout(){
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.snp.makeConstraints{ maker in
            label.font = .systemFont(ofSize: 20, weight: .bold)
            label.text = "Profile view"
            maker.width.equalTo(150)
            maker.height.equalTo(50)
            maker.centerX.equalToSuperview()
            maker.centerY.equalToSuperview()
        }
        
    }
    
    @objc private func didTapLogout(){
        AuthService.shared.logout { [weak self] error in
            guard let self = self else { return }
            if let error = error{
                AlertManager.showLogoutErrorAlert(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate{
                sceneDelegate.validateAuth()
            }
        }
    }
    




}
