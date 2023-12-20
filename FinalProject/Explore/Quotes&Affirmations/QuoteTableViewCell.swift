//
//  QuoteTableViewCell.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 20.12.2023.
//

import UIKit



class QuoteTableViewCell: UITableViewCell {
    static let identifier = "QuoteTableViewCell"
    private let quoteContainer = UIView()
    private let quote: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private let author: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier
        )
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    public func configure(quote: String, author: String){
        self.backgroundColor = .clear
        self.quote.text = quote
        self.author.text = author
    }
    
    private func setupUI(){
        self.addSubview(self.quoteContainer)
        
        self.quoteContainer.translatesAutoresizingMaskIntoConstraints = false
        self.quoteContainer.snp.makeConstraints { make in
            make.height.equalTo(400)
            make.width.equalTo(320)
            make.centerX.equalToSuperview()
            make.top.equalTo(100)
        }
        
        
        
        self.quoteContainer.addSubview(self.quote)
        self.quoteContainer.addSubview(self.author)
        
        self.quote.translatesAutoresizingMaskIntoConstraints = false
        self.author.translatesAutoresizingMaskIntoConstraints = false
        
        self.quote.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(360)
        }
        self.author.snp.makeConstraints { make in
            make.top.equalTo(self.quote.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(35)
        }
    }
}
