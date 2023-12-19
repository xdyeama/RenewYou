//
//  JournalCategoryView.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 19.12.2023.
//

import UIKit

class JournalCategoryView: UIView {
    private let title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    private var imageView: UIImageView?
    init(title: String, image: String){
        self.title.text = title
        self.imageView = UIImageView(image: UIImage(named: image))
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        setupUI()
    }
    
    required init?(coder: NSCoder){
        fatalError("Coder Error")
    }
    
    private func setupUI(){
        self.addSubview(self.title)
        
        self.title.translatesAutoresizingMaskIntoConstraints = false
        self.title.snp.makeConstraints{ maker in
            maker.leading.equalTo(20)
            maker.width.equalTo(200)
            maker.height.equalTo(40)
            maker.centerY.equalToSuperview()
        }
        
        if let imageView = self.imageView {
            self.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.snp.makeConstraints{ make in
                make.trailing.equalTo(self.snp.trailing).offset(-20)
                make.width.equalTo(60)
                make.height.equalTo(self.snp.height)
                make.centerY.equalToSuperview()
            }
        }
    }

}
