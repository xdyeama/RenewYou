//
//  HomeViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 20.12.2023.
//

import UIKit

class HomeViewController: UIViewController {
    private let dateContainer = UIView()
    private let dateMainLabel: UILabel = {
        let label = UILabel()
        label.text = "good morning."
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        return label
    }()
    private let dateSecondaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Wednesday, 20 December"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 0.96)
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI(){
        self.view.addSubview(self.dateContainer)
        self.dateContainer.translatesAutoresizingMaskIntoConstraints = false
        self.dateContainer.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.width.equalTo(280)
            make.height.equalTo(60)
            make.centerX.equalToSuperview()
        }
        
        self.dateContainer.addSubview(self.dateMainLabel)
        self.dateContainer.addSubview(self.dateSecondaryLabel)
        
        self.dateMainLabel.translatesAutoresizingMaskIntoConstraints = false
        self.dateSecondaryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.dateMainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(35)
            make.centerX.equalToSuperview()
        }
        self.dateSecondaryLabel.snp.makeConstraints { make in
            make.top.equalTo(self.dateMainLabel.snp.bottom).offset(5)
            make.width.equalToSuperview()
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
    }
    



}
