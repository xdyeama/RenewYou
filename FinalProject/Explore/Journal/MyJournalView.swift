//
//  MyJournalView.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 19.12.2023.
//

import UIKit

class MyJournalView: UIView {
    private var imageView: UIImageView?
    private let title: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    private let subtitle: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.numberOfLines = 2
        return label
    }()
    
    init(journal: JournalTemplate){
        super.init(frame: .zero)
        self.title.text = journal.title
        self.subtitle.text = journal.subtitle
        self.imageView = UIImageView(image: UIImage(named: journal.image))
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.addSubview(self.title)
        self.addSubview(self.subtitle)
        self.addSubview(self.imageView!)
        
        self.title.translatesAutoresizingMaskIntoConstraints = false
        self.subtitle.translatesAutoresizingMaskIntoConstraints = false
        self.imageView!.translatesAutoresizingMaskIntoConstraints = false
        self.title.snp.makeConstraints{ make in
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(20)
            make.left.equalTo(self.imageView!.snp.right).offset(10)
            make.centerY.equalToSuperview().offset(-15)
        }
        self.subtitle.snp.makeConstraints{ make in
            make.width.equalToSuperview().multipliedBy(0.7)
            make.height.equalTo(40)
            make.left.equalTo(self.imageView!.snp.right).offset(10)
            make.centerY.equalToSuperview().offset(15)
        }
        imageView?.contentMode = .scaleAspectFit
        self.imageView!.snp.makeConstraints { make in
            make.height.equalToSuperview().offset(-10)
            make.width.equalToSuperview().multipliedBy(0.2)
            make.left.equalTo(15)
            make.centerY.equalToSuperview()
        }
        
    }

    
    

}
