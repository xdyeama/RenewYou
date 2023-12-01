//
//  ProfileViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 27.11.2023.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemCyan
        
        var label = UILabel()
        

        
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Profile"
        
        self.view.addSubview(label)
    }

}
