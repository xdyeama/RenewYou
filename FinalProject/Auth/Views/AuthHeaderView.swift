//
//  AuthHeaderView.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 14.12.2023.
//

import UIKit
import SnapKit

class AuthHeaderView: UIView {
    
    // UIComponents
    private let logoView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemCyan
        imageView.image = UIImage(named: "logo")
        imageView.tintColor = .white
        return imageView
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.text = "Error"
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Error"
        return label
    }()

    // Lifecycle
    
    init(title: String, subTitle: String){
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.addSubview(logoView)
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        
        logoView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.logoView.snp.makeConstraints{ maker in
            maker.top.equalTo(self.snp.top).offset(30)
            maker.centerX.equalTo(self.snp.centerX)
            maker.width.height.equalTo(90)
            logoView.layer.cornerRadius = 45
        }
        
        self.titleLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(logoView.snp.bottom).offset(10)
            maker.leading.equalTo(self.snp.leading)
            maker.trailing.equalTo(self.snp.trailing)
        }
        self.subTitleLabel.snp.makeConstraints{ maker in
            maker.top.equalTo(titleLabel.snp.bottom).offset(12)
            maker.leading.equalTo(self.snp.leading)
            maker.trailing.equalTo(self.snp.trailing)
        }
    }
}
