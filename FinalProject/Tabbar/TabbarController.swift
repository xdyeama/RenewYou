//
//  TabbarController.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 23.11.2023.
//

import UIKit

class TabbarController: UITabBarController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.setupTabbar()
        self.setupTabs()

    }
    
    private func setupTabbar(){
        let tabBarColor: UIColor = .white
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = tabBarColor
        self.tabBar.tintColor = UIColor(named: "selectedColor")
        self.tabBar.unselectedItemTintColor = UIColor(named: "textColor")
    }
    
    private func setupTabs(){
        let home = self.createNav(with: "Home", and: UIImage(named: "home_icon"), vc: HomeViewController())
        let discover = self.createNav(with: "Discover", and: UIImage(named: "discover_icon"), vc: DiscoverViewController())
        let consult = self.createNav(with: "Consult", and: UIImage(named: "consult_icon"), vc: ConsultViewController())
        let profile = self.createNav(with: "Profile", and: UIImage(named: "profile_icon"), vc: ProfileViewController())
        self.setViewControllers([home, discover, consult, profile], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
    
        
        return nav
    }
    

}
