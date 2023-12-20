//
//  JournalViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 19.12.2023.
//

import UIKit


class JournalViewController: UIViewController {
    private var journals: [JournalCategoryModel] = []
    var userJournals: [UserJournal] = []
    private let customNavbar = CustomNavbar(with: "journal.")
    private let myJournalsLabel: UILabel = {
        let label = UILabel()
        label.text = "MY JOURNALS"
        label.font = .systemFont(ofSize: 14, weight:
                .regular)
        label.textColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        label.textAlignment = .center
        label.addCharacterSpacing(kernValue: 4)
        return label
    }()
    private let myJournalsContainer = UIStackView()
    private var myJournalOne: MyJournalView?
    private var myJournalTwo: MyJournalView?
    private let mainView = UIScrollView()
    private let contentView = UIView()
    private let categoryJournalsContainer = UIStackView()
    private let titleContainer = TitleContainerView(with: "journal.")
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "EXPLORE JOURNALING"
        label.font = .systemFont(ofSize: 14, weight:
                .regular)
        label.textColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        label.textAlignment = .center
        label.addCharacterSpacing(kernValue: 4)
        return label
    }()

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 0.96)
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
        self.journals = journalsData
        self.myJournalOne = MyJournalView(journal: self.journals[0].templates[0])
        self.myJournalTwo = MyJournalView(journal: journals[1].templates[0])
        
        self.setupNavbar()
        
        self.setupMyJournals()

        self.setupLayout()
        
        self.customNavbar.backButton.addTarget(self, action: #selector(navBack), for: .touchUpInside)
        self.titleContainer.emptyPageButton.addTarget(self, action: #selector(navToEditor), for: .touchUpInside)
        
    }
    
    func setupLayout(){
        self.view.addSubview(self.mainView)
        
        self.mainView.translatesAutoresizingMaskIntoConstraints = false
        self.mainView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().offset(-95)
            make.top.equalTo(customNavbar.snp.bottom)
            mainView.backgroundColor = .clear
        }
        
//        self.mainView.addSubview(self.contentView)
//        self.contentView.translatesAutoresizingMaskIntoConstraints = false
//        self.contentView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//            make.width.equalToSuperview()
//            make.height.equalTo(1200)
//        }
        
        self.mainView.isScrollEnabled = true
        self.mainView.addSubview(self.titleContainer)
        self.titleContainer.translatesAutoresizingMaskIntoConstraints = false
        
        self.titleContainer.snp.makeConstraints { make in
            make.top.equalTo(customNavbar.snp.bottom).offset(10)
            make.width.equalToSuperview()
            make.height.equalTo(40)
            make.horizontalEdges.equalToSuperview()
        }
        self.mainView.addSubview(self.myJournalsLabel)
        self.myJournalsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.myJournalsLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().offset(-32)
            make.height.equalTo(20)
            make.top.equalTo(self.titleContainer.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        self.mainView.addSubview(self.myJournalsContainer)
        self.myJournalsContainer.translatesAutoresizingMaskIntoConstraints = false
        
        self.myJournalsContainer.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.width.equalToSuperview().offset(-32)
            make.top.equalTo(self.myJournalsLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            self.myJournalsContainer.backgroundColor = .white
            self.myJournalsContainer.layer.cornerRadius = 20
        }
        
        self.mainView.addSubview(self.categoryLabel)
        self.categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.categoryLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().offset(-32)
            make.height.equalTo(20)
            make.top.equalTo(self.myJournalsContainer.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        mainView.addSubview(categoryJournalsContainer)
        self.categoryJournalsContainer.translatesAutoresizingMaskIntoConstraints = false
        self.categoryJournalsContainer.distribution = .fillProportionally
        self.categoryJournalsContainer.axis = .vertical
        self.categoryJournalsContainer.spacing = 10
        self.categoryJournalsContainer.snp.makeConstraints { make in
            make.width.equalToSuperview().offset(-32)
            make.height.equalTo(self.journals.count * 80)
            make.top.equalTo(self.categoryLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            self.categoryJournalsContainer.backgroundColor = .clear
        }
        
        setupJournals()
    }
    
    func setupNavbar(){
        self.view.addSubview(self.customNavbar)
        self.customNavbar.translatesAutoresizingMaskIntoConstraints = false
        
        self.customNavbar.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(25)
            make.top.equalTo(60)
        }
    }
    
    func setupMyJournals(){
        myJournalsContainer.axis = .vertical
        myJournalsContainer.spacing = 5
        myJournalsContainer.distribution = .fill
        
        if let myJournalOne = self.myJournalOne, let myJournalTwo = self.myJournalTwo{
            self.myJournalsContainer.addArrangedSubview(myJournalOne)
            self.myJournalsContainer.addArrangedSubview(myJournalTwo)
            
            myJournalOne.translatesAutoresizingMaskIntoConstraints = false
            myJournalTwo.translatesAutoresizingMaskIntoConstraints = false
            
            myJournalOne.snp.makeConstraints { make in
                make.width.equalToSuperview()
                make.height.equalTo(90)
            }
            myJournalTwo.snp.makeConstraints { make in
                make.width.equalToSuperview()
                make.height.equalTo(90)
            }
        }else{
            let label = UILabel()
            label.text = "You have no journals at the moment"
            myJournalsContainer.addArrangedSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            
            label.font = .systemFont(ofSize: 26, weight: .bold)
            label.snp.makeConstraints { make in
                make.width.equalTo(200)
                make.height.equalTo(50)
            }
        }
    }
    
    func setupJournals(){
        for journal in self.journals{
            let categoryView = JournalCategoryView(title: journal.title, image: journal.image)
            
            categoryJournalsContainer.addArrangedSubview(categoryView)
            categoryView.snp.makeConstraints { make in
                make.width.equalToSuperview()
                make.height.equalTo(70)
            }
            if journal.title == "Productivity"{
                categoryView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(navToProductivity)))
            }else if journal.title == "Happiness"{
                categoryView.addGestureRecognizer(UITapGestureRecognizer(target: self,action: #selector(navToHappiness)))
            }else if journal.title == "Self-Discovery"{
                categoryView.addGestureRecognizer(UITapGestureRecognizer(target: self,action: #selector(navToSelfDiscovery)))
            }else{
                categoryView.addGestureRecognizer(UITapGestureRecognizer(target: self,action: #selector(navToStressAnxiety)))
            }
        }
    }
    
    @objc func navToProductivity(){
        let vc = JournalTemplatesViewController()
        vc.category = "productivity"
        vc.journalTemplates = self.journals[0].templates
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func navToHappiness(){
        let vc = JournalTemplatesViewController()
        vc.category = "happiness"
        vc.journalTemplates = self.journals[1].templates
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func navToSelfDiscovery(){
        let vc = JournalTemplatesViewController()
        vc.category = "self-discovery"
        vc.journalTemplates = self.journals[2].templates
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc func navToStressAnxiety(){
        let vc = JournalTemplatesViewController()
        vc.category = "stress"
        vc.journalTemplates = self.journals[3].templates
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func navBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func navToEditor(){
        let vc = JournalEditorViewController()
        vc.isTemplate = false
        vc.topic = ""
        vc.cb = { userJournal in
            self.userJournals.append(userJournal)
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

