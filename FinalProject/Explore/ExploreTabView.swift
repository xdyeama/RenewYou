//
//  ExploreTabBar.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 19.12.2023.
//

import UIKit

class ExploreTabView: UIButton {
    
    init(with image: String){
        super.init(frame: .zero)
        self.layer.cornerRadius = 40
        self.backgroundColor = .red
        setupUI(image: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(image: String){
        let imageView = UIImageView(image: UIImage(named: image))
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        self.translatesAutoresizingMaskIntoConstraints = false
        self.snp.makeConstraints{ maker in
            maker.width.equalTo(170)
            maker.height.equalTo(220)
        }
        self.layer.cornerRadius = 20
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.snp.makeConstraints{ maker in
            maker.edges.equalToSuperview()
        }
    }
}
