//
//  DiscoverViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 27.11.2023.
//

import UIKit

class DiscoverViewController: UIViewController {
    
    private var activityTabs: [ActivityTab] = []
    private lazy var mainView = UIView()
    private lazy var searchContainer = UIView()
    private lazy var searchIcon: UIImageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
    private lazy var browseContainer = UIView()
    private lazy var browseTopSubView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 26
        return stackView
    }()
    private lazy var browseBottomSubView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 14
        return stackView
    }()
    private lazy var browseLabel: UILabel = {
        let label = UILabel()
        label.text = "Browse"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()

    private lazy var popularContainer = UIView()
    private lazy var popularLabel: UILabel = {
       let label = UILabel()
        label.text = "Popular"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        
        return label
    }()
    private lazy var tableViewContainer = UIView()
    private lazy var searchBarContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor =  UIColor(red: 0.748, green: 0.747, blue: 0.747, alpha: 1).cgColor
        
        return view
    }()
    private lazy var searchTextField: UITextField = {
        let txt = UITextField()
        txt.text = "Search sound or video"
        txt.font = .systemFont(ofSize: 18, weight: .medium)
        txt.textColor = UIColor(named: "textColor")
        
        return txt
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        self.view.addSubview(mainView)
        activityTabs = [ActivityTab(title: "How to stay calm", author: "F.S. Fitzherald", bgImage: "activityTabImage", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")]
        mainView.snp.makeConstraints{ (maker) in
            maker.edges.equalToSuperview()
        }
        setupSearchBar()
        setupBrowse()
        setupPopular()
    }
    
    func setupSearchBar(){
        mainView.addSubview(searchBarContainer)
        searchBarContainer.snp.makeConstraints{ (maker) in
            maker.top.equalTo(75)
            maker.centerX.equalToSuperview()
            maker.width.equalToSuperview().offset(-64)
            maker.height.equalTo(54)
        }
        searchBarContainer.addSubview(searchIcon)
        searchIcon.snp.makeConstraints{ (maker) in
            maker.width.height.equalTo(36)
            maker.leading.equalTo(20)
            maker.centerY.equalTo(searchBarContainer.snp.centerY)
            searchIcon.tintColor = UIColor(red: 0.748, green: 0.747, blue: 0.747, alpha: 1)
        }
        
        searchBarContainer.addSubview(searchTextField)
        searchTextField.snp.makeConstraints{ (maker) in
            maker.leading.equalTo(searchIcon.snp.trailing).offset(10)
            maker.width.equalToSuperview().offset(-80)
            maker.height.equalTo(searchIcon.snp.height)
            maker.centerY.equalToSuperview()
        }
        
    }
    
    func setupBrowse(){
        mainView.addSubview(browseContainer)
        browseContainer.snp.makeConstraints{ (maker) in
            maker.width.equalToSuperview().offset(-32)
            maker.height.equalTo(345)
            maker.top.equalTo(152)
            maker.centerX.equalTo(mainView.snp.centerX)
        }
        browseContainer.addSubview(browseLabel)
        browseLabel.snp.makeConstraints{ (maker) in
            maker.top.equalToSuperview()
            maker.width.equalToSuperview()
            maker.height.equalTo(30)
        }
        browseContainer.addSubview(browseTopSubView)
        browseTopSubView.snp.makeConstraints{ (maker) in
            maker.width.equalToSuperview()
            maker.height.equalTo(177)
            maker.top.equalTo(browseLabel.snp.bottom)
        }
        browseContainer.addSubview(browseBottomSubView)
        browseBottomSubView.snp.makeConstraints{ (maker) in
            maker.width.equalToSuperview()
            maker.height.equalTo(119)
            maker.top.equalTo(browseTopSubView.snp.bottom).offset(14)
            }
        browseTopSubView.addArrangedSubview(setupTopTab(image: "meditation", title: "Meditation"))
        browseTopSubView.addArrangedSubview(setupTopTab(image: "stress", title: "Stress relief"))
        
        browseBottomSubView.addArrangedSubview(setupBottomTab(image: "ideation", title: "Ideation"))
        browseBottomSubView.addArrangedSubview(setupBottomTab(image: "consultation", title: "Consultation"))
        browseBottomSubView.addArrangedSubview(setupBottomTab(image: "reading", title: "Reading"))
        
    }
    
    func setupTopTab(image: String, title: String) -> UIView{
        lazy var tabView = UIView()
        lazy var imageContainer = UIButton()
        lazy var imageView = UIImageView(image: UIImage(named: image))
        lazy var label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(red: 0.481, green: 0.481, blue: 0.481, alpha: 1)
        label.textAlignment = .center
        
        tabView.snp.makeConstraints{ maker in
            maker.width.equalTo(160)
            maker.height.equalTo(177)
        }
        tabView.addSubview(imageContainer)
        imageContainer.snp.makeConstraints{ maker in
            maker.width.equalToSuperview()
            maker.height.equalTo(157)
            maker.top.equalToSuperview()
            imageContainer.layer.cornerRadius = 25
        }
        imageContainer.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.snp.makeConstraints{ maker in
            maker.edges.equalToSuperview()
        }
        tabView.addSubview(label)
        label.snp.makeConstraints{ maker in
            maker.width.equalToSuperview()
            maker.height.equalTo(20)
            maker.top.equalTo(imageContainer.snp.bottom).offset(5)
        }
        return tabView
    }
    
    func setupBottomTab(image: String, title: String) -> UIView{
        lazy var tabView = UIView()
        lazy var imageContainer = UIButton()
        lazy var imageView = UIImageView(image: UIImage(named: image))
        lazy var label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(red: 0.481, green: 0.481, blue: 0.481, alpha: 1)
        label.textAlignment = .center
        
        tabView.snp.makeConstraints{ maker in
            maker.width.equalTo(106)
            maker.height.equalTo(117)
        }
        tabView.addSubview(imageContainer)
        imageContainer.snp.makeConstraints{ maker in
            maker.width.equalToSuperview()
            maker.height.equalTo(97)
            maker.top.equalToSuperview()
            imageContainer.layer.cornerRadius = 20
        }
        imageContainer.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.snp.makeConstraints{ maker in
            maker.edges.equalToSuperview()
        }
        tabView.addSubview(label)
        label.snp.makeConstraints{ maker in
            maker.width.equalToSuperview()
            maker.height.equalTo(14)
            maker.top.equalTo(imageContainer.snp.bottom).offset(5)
        }
        return tabView
    }
    
    func setupPopular(){
        mainView.addSubview(popularContainer)
        popularContainer.addSubview(popularLabel)
        popularContainer.addSubview(tableViewContainer)
        
        popularContainer.snp.makeConstraints{ (maker) in
            maker.top.equalTo(browseContainer.snp.bottom).offset(16)
            maker.width.equalToSuperview().offset(-32)
            maker.height.equalTo(200)
            maker.centerX.equalToSuperview()
            
        }
        
        popularLabel.snp.makeConstraints{ (maker) in
            maker.top.equalToSuperview()
            maker.width.equalToSuperview()
            maker.horizontalEdges.equalToSuperview()
            maker.height.equalTo(30)
            
        }
        tableViewContainer.snp.makeConstraints{ (maker) in
            maker.top.equalTo(popularLabel.snp.bottom)
            maker.height.equalTo(200)
            maker.width.equalToSuperview()
        }
        
        for activityTab in activityTabs{
            let tabView = setupPopularTabView(title: activityTab.title, author: activityTab.author, bgImage: activityTab.bgImage, text: activityTab.text)
            
            tableViewContainer.addSubview(tabView)
            tabView.snp.makeConstraints{ (maker) in

                maker.top.equalTo(20)
            }

            
        }
        
    }
    
    func setupPopularTabView(title: String, author: String, bgImage: String, text: String) -> UIView{
        let tabView = UIView()
        let textContainer = UIView()
        let titleLabel = UILabel()
        titleLabel.text = title
        let authorLabel = UILabel()
        authorLabel.text = author
        let textLabel = UILabel()
        textLabel.text = text
        let bgImageView = UIImageView(image: UIImage(named: bgImage))
        
        
        tabView.layer.cornerRadius = 10
        
        tabView.snp.makeConstraints{ (maker) in
            maker.width.equalTo(300)
            maker.height.equalTo(140)
        }
        tabView.addSubview(bgImageView)
        bgImageView.snp.makeConstraints{ (maker) in
            maker.edges.equalToSuperview()
        }
        
        tabView.addSubview(textContainer);
        textContainer.layer.cornerRadius = 10
        textContainer.snp.makeConstraints{ (maker) in
            maker.leading.equalTo(100)
            maker.width.equalTo(200)
            maker.height.equalToSuperview()
            textContainer.backgroundColor = .white
            textContainer.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
            textContainer.layer.borderWidth = 1
        }
        
        textContainer.addSubview(titleLabel)
        titleLabel.snp.makeConstraints{ (maker) in
            maker.width.equalTo(168)
            maker.height.equalTo(20)
            maker.top.equalTo(20)
            maker.leading.equalTo(16)
            titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
            titleLabel.textColor = .black
        }
        
        textContainer.addSubview(authorLabel)
        authorLabel.snp.makeConstraints{ (maker) in
            maker.width.equalTo(100)
            maker.height.equalTo(13)
            maker.top.equalTo(titleLabel.snp.bottom).offset(5)
            maker.leading.equalTo(16)
            authorLabel.font = .systemFont(ofSize: 10,weight: .bold)
            authorLabel.textColor = UIColor(red: 135 / 255, green: 135 / 255, blue: 135 / 255, alpha: 1)
        }
        
        textContainer.addSubview(textLabel)
        textLabel.snp.makeConstraints{ (maker) in
            maker.width.equalTo(166)
            maker.height.equalTo(60)
            maker.top.equalTo(authorLabel.snp.bottom).offset(5)
            maker.leading.equalTo(16)
            textLabel.font = .systemFont(ofSize: 11, weight: .bold)
            textLabel.textColor = .black
            textLabel.textAlignment = .natural
            textLabel.lineBreakMode = .byWordWrapping
            textLabel.numberOfLines = 4
        }
            
        return tabView
    }


}
