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
        label.text = ""
        label.font = UIFont(name: "SFProRounded-Bold", size: 30)
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
    
    private lazy var tableViewContainer = UIScrollView()
    
    
    
    private lazy var therapyTab = UIView()
    private lazy var moodtrackerTab = UIView()
    private lazy var journalingTab = UIView()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AuthService.shared.fetchUser { [weak self] user, error in
            guard let self = self else { return }
            if let error = error{
                AlertManager.showFetchingError(on: self, with: error)
                return
            }
            
            if let user = user{
                self.nameLabel.text = user.username
            }
        }
        
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
        
        therapyTab = categoryTabSetup(labelText: "Therapy", image: "therapyTabImage", vc: JournalViewController())
        moodtrackerTab = categoryTabSetup(labelText: "Mood Tracker", image: "moodtrackerTabImage", vc: JournalViewController())
        journalingTab = categoryTabSetup(labelText: "Journaling", image: "journalingTabImage2", vc: JournalViewController())
        categoriesView.addArrangedSubview(therapyTab)
        categoriesView.addArrangedSubview(moodtrackerTab)
        categoriesView.addArrangedSubview(journalingTab)
        
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
    
    
    @objc func navigate(){
        let vc = JournalViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}



