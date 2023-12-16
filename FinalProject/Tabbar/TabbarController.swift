//
//  TabbarController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 23.11.2023.
//

import UIKit
import SnapKit

class TabbarController: UITabBarController {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTabbar()
        self.setupTabs()
//        self.layoutContainer()

    }
    
    private func setupTabbar(){
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = UIColor(named: "selectedColor")
        self.tabBar.unselectedItemTintColor = UIColor(named: "textColor")
    }
    
    private func setupTabs(){
        let home = self.createNav(with: "Home", and: UIImage(named: "home_icon"), vc: HomeViewController())
        let discover = self.createNav(with: "Discover", and: UIImage(named: "discover_icon"), vc: DiscoverViewController())
        let consult = self.createNav(with: "Consult", and: UIImage(named: "consult_icon"), vc: ConsultViewController())
        let profile = self.createNav(with: "Profile", and: UIImage(named: "profile_icon"), vc: ProfileViewController())
        self.viewControllers = [home, discover, consult, profile]
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
    
        
        return nav
    }
    
    private func layoutContainer(){
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.snp.makeConstraints{(maker) in
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.bottom.equalToSuperview()
            maker.height.equalTo(90)
        }
    }
    

}
