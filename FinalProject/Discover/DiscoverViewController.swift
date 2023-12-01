//
//  DiscoverViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 27.11.2023.
//

import UIKit

class DiscoverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBlue
        
        var label = UILabel()
        

        
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Discover"
        
        self.view.addSubview(label)
    }


}
