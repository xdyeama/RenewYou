//
//  SceneDelegate.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 23.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = .white
        
        
        let tabbar = UITabBarController()
        
        
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let discoverVC =  UINavigationController(rootViewController: DiscoverViewController())
        let consultVC = UINavigationController(rootViewController: ConsultViewController())
        let profileVC = UINavigationController(rootViewController: LoginViewController())
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home_icon"), selectedImage: UIImage(named: "home"))
        discoverVC.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(named: "discover_icon"), selectedImage: UIImage(named: "discover_icon"))
        consultVC.tabBarItem = UITabBarItem(title: "Consult", image: UIImage(named: "consult_icon"), selectedImage: UIImage(named: "consult_icon"))
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile_icon"), selectedImage: UIImage(named: "profile_icon"))
        
        tabbar.viewControllers = [homeVC, discoverVC, consultVC, profileVC]
        
        tabbar.tabBar.isTranslucent = false
        tabbar.tabBar.barStyle = .default
        
        
        window.rootViewController = tabbar
        
        self.window = window
        self.window?.makeKeyAndVisible()

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

