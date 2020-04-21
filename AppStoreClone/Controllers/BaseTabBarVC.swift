//
//  BaseTabBarVC.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 20/04/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import Foundation
import UIKit

class BaseTabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todayVC = self.createTabItem(viewController: UIViewController(), title: "Hoje", image: "icone-hoje")
        let appsVC = self.createTabItem(viewController: AppsVC(), title: "Apps", image: "icone-apps")
        let searchVC = self.createTabItem(viewController: SearchVC(), title: "Busca", image: "icone-busca")
        
        viewControllers = [
            todayVC,
            appsVC,
            searchVC
        ]
        
        selectedIndex = 2
    }
    
    func createTabItem(viewController: UIViewController, title: String, image: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        
        viewController.navigationItem.title = title
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: image)
        viewController.view.backgroundColor = .white
        
        return navController
    }
    
}
