//
//  AppDelegate.swift
//  StarbucksClone
//
//  Created by Владимир Муравьев on 23.02.2023.
//

import UIKit
import Foundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        
        let tabBarController = UITabBarController()
        let homeVC = HomeViewController()
        let scanVC = ScanViewController()
        let orderVC = OrderViewController()
        let giftVC = GiftViewController()
        let storeVC = StoreViewController()
        
        let homeNC = makeNavigationController(rootVC: homeVC)
        let scanNC = makeNavigationController(rootVC: scanVC)
        let orderNC = makeNavigationController(rootVC: orderVC)
        let giftNC = makeNavigationController(rootVC: giftVC)
        let storeNC = makeNavigationController(rootVC: storeVC)
        
        
        tabBarController.viewControllers = [
            homeNC,
            scanNC,
            orderNC,
            giftNC,
            storeNC
        ]
        
        window?.rootViewController = tabBarController
        return true
        
    }
    
    func makeNavigationController(rootVC: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootVC)
        navigationController.navigationBar.prefersLargeTitles = true
        
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.label,
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title1).bold()
        ]

        navigationController.navigationBar.largeTitleTextAttributes = attributes
        return navigationController
        
    }

}

