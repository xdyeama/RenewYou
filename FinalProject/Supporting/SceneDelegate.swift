//
//  SceneDelegate.swift
//  FinalProject
//
//  Created by Beket Barlykov  on 23.11.2023.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        setupWindow(with: scene)
        self.validateAuth()
        

    }
    
    func setupWindow(with scene: UIScene){
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.backgroundColor = .white
        
        self.window = window
        self.window?.makeKeyAndVisible()
    }
    
    func setupTabbar(with tabbar: UITabBarController){
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let discoverVC =  UINavigationController(rootViewController: DiscoverViewController())
        let consultVC = UINavigationController(rootViewController: ConsultViewController())
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home_icon"), selectedImage: UIImage(named: "home"))
        discoverVC.tabBarItem = UITabBarItem(title: "Discover", image: UIImage(named: "discover_icon"), selectedImage: UIImage(named: "discover_icon"))
        consultVC.tabBarItem = UITabBarItem(title: "Consult", image: UIImage(named: "consult_icon"), selectedImage: UIImage(named: "consult_icon"))
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile_icon"), selectedImage: UIImage(named: "profile_icon"))
        
        tabbar.viewControllers = [homeVC, discoverVC, consultVC, profileVC]
        
        tabbar.tabBar.isTranslucent = false
        tabbar.tabBar.barStyle = .default
        
    }
    
    public func validateAuth(){
        if Auth.auth().currentUser == nil {
            // go to sign in screen
            let vc = LoginViewController()
            animateToController(with: vc)
        }else{
            // go to home screen
            let tabbar = UITabBarController()
            setupTabbar(with: tabbar)
            animateToController(with: tabbar)
            
        }
    }
    
    private func animateToController(with vc: UIViewController){
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 0.25) {
                self?.window?.layer.opacity = 0
            } completion: { [weak self] _ in
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                self?.window?.rootViewController = nav
                
                UIView.animate(withDuration: 0.25) { [weak self] in
                    self?.window?.layer.opacity = 1
                }
            }
        }
    }



}

