//
//  CustomNavbar.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 19.12.2023.
//

import UIKit

class CustomNavbar: UIView {
    public let backButton = UIButton()
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()


    init(with title: String){
        super.init(frame: .zero)
        self.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 0.96)
        self.label.text = title
        setupUI()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.width.height.equalTo(25)
            make.top.equalTo(0)
        }
        let backButtonImage = UIImageView(image: UIImage(named: "backButton"))
        backButton.addSubview(backButtonImage)
        backButtonImage.contentMode = .scaleToFill
        backButtonImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(25)
            make.leading.trailing.equalToSuperview()
        }

    }
    

}
