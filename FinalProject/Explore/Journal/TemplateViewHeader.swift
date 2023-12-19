//
//  ProductivityHeader.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 19.12.2023.
//

import UIKit

class TemplateViewHeader: UIView {
    private var imageView = UIImageView()
    private var title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    private let subTitle: UILabel = {
        let label = UILabel()
        label.text = "JOURNALING"
        label.addCharacterSpacing(kernValue: 3)
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .center
        label.textColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        return label
    }()
    init(image: String, title: String){
        super.init(frame: .zero)
        self.backgroundColor = .clear
        self.imageView = UIImageView(image: UIImage(named: image))
        self.title.text = title + "."
        self.setupUI()
    }
    
    required init?(coder: NSCoder){
        fatalError("error")
    }
    
    func setupUI(){
        
        self.addSubview(self.imageView)
        self.addSubview(self.subTitle)
        self.addSubview(self.title)
        
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.subTitle.translatesAutoresizingMaskIntoConstraints = false
        self.title.translatesAutoresizingMaskIntoConstraints = false
        
        self.imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(70)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
        }
        self.subTitle.snp.makeConstraints { make in
            make.top.equalTo(self.imageView.snp.bottom).offset(10)
            make.width.equalToSuperview()
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
        }
        self.title.snp.makeConstraints { make in
            make.top.equalTo(self.subTitle.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            
        }
    }
    
}
