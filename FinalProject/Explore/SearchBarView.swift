//
//  SearchBarView.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 19.12.2023.
//

import UIKit

class SearchBarView: UIView {
    
    private lazy var searchIcon: UIImageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
    private lazy var searchTextField: UITextField = {
        let txt = UITextField()
        txt.text = "Exercises, quotes and your entries"
        txt.font = .systemFont(ofSize: 16, weight: .regular)
        txt.textColor = .black
        
        return txt
    }()

    init(){
        super.init(frame: .zero)
        self.backgroundColor = UIColor(red: 0.888, green: 0.88, blue: 0.88, alpha: 0.8)
        self.layer.cornerRadius = 10
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(){
        self.snp.makeConstraints{ (maker) in
            maker.height.equalTo(60)
        }
        self.addSubview(searchIcon)
        searchIcon.snp.makeConstraints{ (maker) in
            maker.left.equalTo(45)
            maker.width.height.equalTo(24)
            maker.leading.equalTo(20)
            maker.centerY.equalTo(self.snp.centerY)
            searchIcon.tintColor = .black
        }
        
        self.addSubview(searchTextField)
        searchTextField.snp.makeConstraints{ (maker) in
            maker.leading.equalTo(searchIcon.snp.trailing).offset(5)
            maker.width.equalTo(250)
            maker.height.equalTo(54)
            maker.centerY.equalTo(searchIcon.snp.centerY)
        }
    }
    
}
