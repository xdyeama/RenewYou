//
//  JournalTemplateViewCell.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 19.12.2023.
//

import UIKit

class JournalTemplateViewCell: UICollectionViewCell {
    static let identifier = "JournalTemplateViewCell"
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "questionmark")
        return imageView
    }()
    private let title: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    private let subTitle: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.numberOfLines = 3
        return label
    }()
    
    public func configure(image: UIImage, title: String, subTitle: String){
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.imageView = UIImageView(image: image)
        self.title.text = title
        self.subTitle.text = subTitle
        self.setupUI()
    }
    
    private func setupUI(){
        self.addSubview(self.imageView)
        self.addSubview(self.title)
        self.addSubview(self.subTitle)
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.title.translatesAutoresizingMaskIntoConstraints = false
        self.subTitle.translatesAutoresizingMaskIntoConstraints = false
        
        self.imageView.snp.makeConstraints { make in
            make.top.equalTo(30)
            make.height.equalTo(100)
            make.width.equalTo(60)
            make.centerX.equalToSuperview()
        }
        
        self.title.snp.makeConstraints { make in
            make.top.equalTo(self.imageView.snp.bottom).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
        
        self.subTitle.snp.makeConstraints { make in
            make.top.equalTo(self.title.snp.bottom).offset(5)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
        }
    }
}
