//
//  HomeViewController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 25.11.2023.
//

import UIKit
import SnapKit


struct CategoryTab{
    let title: String
    let image: UIImageView
    let view: UIView
};

struct ActivityTab{
    let title: String
    let author: String
    let bgImage: String
    let text: String
}

class HomeViewController: UIViewController {
    private let categoryTabs: [CategoryTab] = [CategoryTab(title: "Therapy", image: UIImageView(image: UIImage(named: "therapyTabImage")), view: UIView()),CategoryTab(title: "Mood Tracker", image: UIImageView(image: UIImage(named: "moodtrackerTabImage")), view: UIView()),CategoryTab(title: "Journaling", image: UIImageView(image: UIImage(named: "journalingTabImage")), view: UIView()), ]
    var activityTabs: [ActivityTab] = []
    private lazy var bgView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var bottomView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        
        return view
    }()
    
    private lazy var topContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    private lazy var profileImageContainer: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 50
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var searchBarContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var searchTextField: UITextField = {
        let txt = UITextField()
        txt.text = "Search sound or video"
        txt.font = .systemFont(ofSize: 18, weight: .medium)
        txt.textColor = UIColor(named: "textColor")
        
        return txt
    }()
    
    private lazy var bgImage = UIImageView(image: UIImage(named: "topViewBg"))
    private lazy var profileImage: UIImageView = UIImageView(image: UIImage(named: "profile_image"))
    
    private lazy var searchIcon: UIImageView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
    
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Beket"
        label.font = UIFont(name: "SFProRounded-Bold", size: 24)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var mainGrid: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.distribution = .fillEqually
        stackView.spacing = 25
        return stackView
    }()
    
    private lazy var categoryContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var lastActivityContainer = UIScrollView()
    
    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.backgroundColor = .clear
        
        return label
    }()
    
    private lazy var categoriesView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 14
        stackView.backgroundColor = .clear
        return stackView
        
    }()
    
    private lazy var lastActivityLabel: UILabel = {
        let label = UILabel()
        label.text = "Last Activities"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.backgroundColor = .clear
        
        return label
    }()
    
    private lazy var tableViewContainer = UIScrollView()
    
    
    
    private lazy var therapyTab = UIView()
    private lazy var moodtrackerTab = UIView()
    private lazy var journalingTab = UIView()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityTabs = [ActivityTab(title: "How to stay calm", author: "F.S. Fitzherald", bgImage: "activityTabImage", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")]
        layoutSubviews()
    }
    
    func setupCategoryTabs(view: UIView, title: String, imageView: UIImageView){
        view.snp.makeConstraints{ (maker) in
            maker.height.equalTo(100)
            maker.width.equalTo(120)
        }
        
    }
}


extension HomeViewController{
    func layoutSubviews(){
        
        view.addSubview(bgView)
        bgView.snp.makeConstraints{ (maker) in
            maker.edges.equalToSuperview()
        }
        
        bgView.addSubview(topView)
        bgView.addSubview(bottomView)
        topView.snp.makeConstraints{ (maker) in
            maker.horizontalEdges.equalToSuperview()
            maker.height.equalTo(290)
            maker.width.equalToSuperview()
        }
        
        bottomView.snp.makeConstraints{ (maker) in
            maker.horizontalEdges.equalToSuperview()
            maker.height.equalTo(500)
            maker.bottom.equalToSuperview().offset(-10)
        }
        

        topView.addSubview(bgImage)
        
        bgImage.contentMode = .scaleAspectFill
        
        bgImage.snp.makeConstraints{ view in
            view.edges.equalToSuperview()
        }
        
        layoutTop()
        layoutBottom()
    }
    func layoutTop(){
        topView.addSubview(topContainer)
        
        
        topView.addSubview(profileImageContainer)
        topView.addSubview(helloLabel)
        topView.addSubview(nameLabel)
        topView.addSubview(searchBarContainer)
        searchBarContainer.addSubview(searchIcon)
        searchBarContainer.addSubview(searchTextField)
        
        profileImageContainer.snp.makeConstraints{ (maker) in
            maker.width.height.equalTo(100)
            maker.top.equalTo(70)
            maker.leading.equalTo(20)
        }
        
        profileImageContainer.addSubview(profileImage)
        
        searchIcon.contentMode = .scaleAspectFit
        searchIcon.tintColor = UIColor(named: "textColor")
        profileImage.contentMode = .scaleAspectFit
        
        profileImage.snp.makeConstraints{ (maker) in
            maker.edges.equalToSuperview()
            maker.width.height.equalToSuperview()
        }
        
        helloLabel.snp.makeConstraints{ (maker) in
            maker.leading.equalTo(profileImageContainer.snp.trailing).offset(10)
            maker.top.equalTo(profileImageContainer.snp.top).offset(25)
            maker.width.equalToSuperview()
        }
        nameLabel.snp.makeConstraints{ (maker) in
            maker.leading.equalTo(helloLabel.snp.leading)
            maker.top.equalTo(helloLabel.snp.top).offset(30)
            maker.width.equalToSuperview()
        }
        searchBarContainer.snp.makeConstraints{ (maker) in
            maker.top.equalTo(profileImageContainer.snp.bottom).offset(15)
            maker.width.equalToSuperview().offset(-40)
            maker.height.equalTo(54)
            maker.leading.equalTo(profileImageContainer.snp.leading)
        }
        
        searchIcon.snp.makeConstraints{ (maker) in
            maker.width.height.equalTo(36)
            maker.leading.equalTo(20)
            maker.centerY.equalTo(searchBarContainer.snp.centerY)
        }
        
        searchTextField.snp.makeConstraints{ (maker) in
            maker.leading.equalTo(searchIcon.snp.trailing).offset(10)
            maker.width.equalToSuperview().offset(-80)
            maker.height.equalTo(searchIcon.snp.height)
            maker.centerY.equalToSuperview()
        }
        
    }
    
    func layoutBottom(){
        bottomView.addSubview(mainGrid)
        mainGrid.addArrangedSubview(categoryContainer)
        mainGrid.addArrangedSubview(lastActivityContainer)
        categoryContainer.addArrangedSubview(categoryLabel)
        categoryContainer.addArrangedSubview(categoriesView)
        
        mainGrid.translatesAutoresizingMaskIntoConstraints = false
        
        mainGrid.snp.makeConstraints{ (maker) in
            maker.width.equalToSuperview().offset(-32)
            maker.height.equalToSuperview().offset(-30)
            maker.top.equalTo(10)
            maker.centerX.equalTo(bottomView.snp.centerX)
        }
        
        categoryContainer.snp.makeConstraints{ (maker) in
            maker.width.equalToSuperview()
            maker.height.equalTo(160)
            maker.top.equalToSuperview().offset(25)
            maker.centerX.equalToSuperview()
        }
        categoryLabel.snp.makeConstraints{ (maker) in
            maker.height.equalTo(30)
            maker.width.equalToSuperview()
        }
        lastActivityContainer.snp.makeConstraints{ (maker) in
            maker.width.equalToSuperview()
            maker.height.equalTo(160)
            maker.centerX.equalToSuperview()
        }
        
        therapyTab = categoryTabSetup(labelText: "Therapy", image: "therapyTabImage", vc: JournalingViewController())
        moodtrackerTab = categoryTabSetup(labelText: "Mood Tracker", image: "moodtrackerTabImage", vc: JournalingViewController())
        journalingTab = categoryTabSetup(labelText: "Journaling", image: "journalingTabImage2", vc: JournalingViewController())
        categoriesView.addArrangedSubview(therapyTab)
        categoriesView.addArrangedSubview(moodtrackerTab)
        categoriesView.addArrangedSubview(journalingTab)
        
        setupLastActivities()
    }
    
    func categoryTabSetup(labelText: String, image: String, vc: UIViewController) -> UIView{
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.snp.makeConstraints{ (maker) in
            maker.width.equalTo(110)
            maker.height.equalTo(120)
        }
        let tabView = UIButton()
        tabView.addTarget(self, action: #selector(navigate), for: .touchUpInside)
        tabView.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(tabView)
        tabView.snp.makeConstraints{ (maker) in
            maker.width.equalToSuperview()
            maker.height.equalTo(100)
            maker.top.equalToSuperview()
            tabView.layer.cornerRadius = 20
        }
        tabView.backgroundColor = .clear
        let imageView = UIImageView(image: UIImage(named: image))
        tabView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints{ (maker) in
            maker.edges.equalToSuperview()
        }
        let label: UILabel = {
            let view = UILabel()
            view.text = labelText
            view.font = .systemFont(ofSize: 14, weight: .bold)
            view.textColor = UIColor(red: 0.481, green: 0.481, blue: 0.481, alpha: 1)
            view.textAlignment = .center

            return view
        }()
        container.addSubview(label)
        
        label.snp.makeConstraints{ (maker) in
            maker.top.equalTo(tabView.snp.bottom)
            maker.width.equalToSuperview()
            maker.height.equalTo(20)
        }
        
        
        return container
    }
    
    func setupLastActivities(){
        lastActivityContainer.addSubview(lastActivityLabel)
        lastActivityContainer.addSubview(tableViewContainer)
        
        lastActivityContainer.snp.makeConstraints{ (maker) in
            maker.top.equalTo(categoryContainer.snp.bottom)
            maker.width.equalToSuperview()
            maker.height.equalTo(200)
            maker.centerX.equalToSuperview()
            
        }
        
        lastActivityLabel.snp.makeConstraints{ (maker) in
            maker.top.equalToSuperview()
            maker.width.equalToSuperview()
            maker.horizontalEdges.equalToSuperview()
            maker.height.equalTo(30)
            
        }
        tableViewContainer.snp.makeConstraints{ (maker) in
            maker.top.equalTo(lastActivityLabel.snp.bottom)
            maker.height.equalTo(200)
            maker.width.equalToSuperview()
        }
        
        for activityTab in activityTabs{
            let tabView = setupActivityTabView(title: activityTab.title, author: activityTab.author, bgImage: activityTab.bgImage, text: activityTab.text)
            
            tableViewContainer.addSubview(tabView)
            tabView.snp.makeConstraints{ (maker) in

                maker.top.equalTo(20)
            }

            
        }
        
    }
    
    func setupActivityTabView(title: String, author: String, bgImage: String, text: String) -> UIView{
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
    
    @objc func navigate(){
        let vc = JournalingViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}



