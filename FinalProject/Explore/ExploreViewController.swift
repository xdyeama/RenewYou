//
//  DiscoverViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 27.11.2023.
//

import UIKit

class ExploreViewController: UIViewController {
    
    private lazy var mainView = UIView()
    private lazy var searchContainer = SearchBarView()
    private lazy var tabsContainer = UIView()
    private lazy var journalTab = ExploreTabView(with: "journal")
    private lazy var breatheTab = ExploreTabView(with: "breathe")
    private lazy var meditateTab = ExploreTabView(with: "meditate")
    private lazy var affirmationsTab = ExploreTabView(with: "affirmations")
    private lazy var exploreLabel: UILabel = {
        let label = UILabel()
        label.text = "explore."
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.textAlignment = .center
        return label
    }()




    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 244/255, alpha: 0.96)
        self.view.addSubview(mainView)
        self.navigationController?.navigationBar.isHidden = true
        mainView.snp.makeConstraints{ (maker) in
            maker.edges.equalToSuperview()
        }
        setupLayout()
        
        journalTab.addTarget(self, action: #selector(navToJournal), for: .touchUpInside)
        breatheTab.addTarget(self, action: #selector(navToBreathe), for: .touchUpInside)
        meditateTab.addTarget(self, action: #selector(navToMeditate), for: .touchUpInside)
        affirmationsTab.addTarget(self, action: #selector(navToAffirmations), for: .touchUpInside)
    }
    
    
    
    func setupLayout(){
        mainView.addSubview(exploreLabel)
        exploreLabel.translatesAutoresizingMaskIntoConstraints = false
        exploreLabel.snp.makeConstraints{ maker in
            maker.width.equalToSuperview()
            maker.height.equalTo(50)
            maker.top.equalTo(100)
            maker.centerX.equalToSuperview()
        }
        mainView.addSubview(searchContainer)
        searchContainer.translatesAutoresizingMaskIntoConstraints = false
        searchContainer.snp.makeConstraints { make in
            make.top.equalTo(exploreLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(-32)
        }
        mainView.addSubview(tabsContainer)
        tabsContainer.translatesAutoresizingMaskIntoConstraints = false
        tabsContainer.snp.makeConstraints { make in
            make.width.equalToSuperview().offset(-32)
            make.height.equalToSuperview().multipliedBy(0.6)
            make.top.equalTo(searchContainer.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            tabsContainer.backgroundColor = .white
        }
        
        setupTabs()
    }
    
    func setupTabs(){
        tabsContainer.addSubview(journalTab)
        tabsContainer.addSubview(breatheTab)
        tabsContainer.addSubview(meditateTab)
        tabsContainer.addSubview(affirmationsTab)
        journalTab.translatesAutoresizingMaskIntoConstraints = false
        breatheTab.translatesAutoresizingMaskIntoConstraints = false
        meditateTab.translatesAutoresizingMaskIntoConstraints = false
        affirmationsTab.translatesAutoresizingMaskIntoConstraints = false
        
        journalTab.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        breatheTab.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
        }
        meditateTab.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
        }
        affirmationsTab.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
            
    
    

    // MARK: -- Selectors
    
    @objc private func navToJournal(){
        let vc = JournalViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func navToBreathe(){
        let vc = BreatheViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func navToMeditate(){
        let vc = MeditateViewController()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc private func navToAffirmations(){
        let vc = AffirmationsViewController()
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
