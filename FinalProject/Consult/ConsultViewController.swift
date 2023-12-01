//
//  ConsultViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 27.11.2023.
//

import UIKit

class ConsultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemPink
        
        var label = UILabel()
        

        
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Consult"
        
        self.view.addSubview(label)
    }

}
