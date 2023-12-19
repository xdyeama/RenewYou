//
//  TitleContainerVIew.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 19.12.2023.
//

import UIKit

class TitleContainerView: UIView {
    private let titleLabel: UILabel = {
        let title = UILabel()
        title.text = "journal."
        title.font = .systemFont(ofSize: 26, weight: .bold)
        title.textAlignment = .left
        return title
    }()
    private let emptyPageButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    private let buttonTitle: UILabel = {
        let title = UILabel()
        title.text = "Empty Page"
        title.textColor = .black
        title.textAlignment = .center
        title.font = .systemFont(ofSize: 14, weight: .bold)
        return title
    }()
    init(with title: String){
        super.init(frame: .zero)
        titleLabel.text = title
        self.setupUI()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        self.addSubview(self.titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.titleLabel.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.width.equalTo(150)
            make.top.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        self.addSubview(self.emptyPageButton)
        self.emptyPageButton.translatesAutoresizingMaskIntoConstraints = false

        self.emptyPageButton.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalToSuperview()
            make.right.equalTo(-10)
        }
        
        self.emptyPageButton.addSubview(self.buttonTitle)
        self.buttonTitle.translatesAutoresizingMaskIntoConstraints = false
        self.buttonTitle.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}
