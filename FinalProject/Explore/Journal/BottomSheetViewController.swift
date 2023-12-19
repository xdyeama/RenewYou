//
//  BottomSheetViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 20.12.2023.
//

import UIKit

class BottomSheetViewController: UIViewController {
    var journal: JournalTemplate = JournalTemplate(title: "", subtitle: "", image: "", topic: "")
    private let journalingLabel: UILabel = {
        let label = UILabel()
        label.text = "JOURNALING"
        label.addCharacterSpacing(kernValue: 3)
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        label.textColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        return label
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "End of Year Reflection".lowercased()
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    private let subTitle: UILabel = {
        let label = UILabel()
        label.text = "Let's reflect on this, year, what you've learned and how you can be better next year."
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 3
        return label
    }()
    public let beginJournalingButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        return button
    }()
    private let buttonText: UILabel = {
        let label = UILabel()
        label.text = "Begin Journaling"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var dimmedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    private var minTopSpacing: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.titleLabel.text = self.journal.title
        self.subTitle.text = self.journal.subtitle
        setupViews()
        
        
    }
    
    func setupViews(){

        self.view.addSubview(self.journalingLabel)
        self.journalingLabel.translatesAutoresizingMaskIntoConstraints = false
        self.journalingLabel.snp.makeConstraints { make in
            make.top.equalTo(30)
            make.width.equalTo(200)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(self.titleLabel)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.journalingLabel.snp.bottom).offset(5)
            make.width.equalTo(200)
            make.height.equalTo(75)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(self.subTitle)
        self.subTitle.translatesAutoresizingMaskIntoConstraints = false
        self.subTitle.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(30)
            make.width.equalToSuperview().offset(-96)
            make.height.equalTo(75)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(self.beginJournalingButton)
        self.beginJournalingButton.translatesAutoresizingMaskIntoConstraints = false
        self.beginJournalingButton.snp.makeConstraints { make in
            make.top.equalTo(self.subTitle.snp.bottom).offset(40)
            make.width.equalTo(250)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        self.beginJournalingButton.addSubview(self.buttonText)
        self.buttonText.translatesAutoresizingMaskIntoConstraints = false
        self.buttonText.snp.makeConstraints { make in
            make.width.equalToSuperview().offset(-30)
            make.height.equalToSuperview().multipliedBy(0.33)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    
    
}
