//
//  ViewController.swift
//  AppStore
//
//  Created by Eric Agredo on 5/13/20.
//  Copyright © 2020 Agredo. All rights reserved.
//

import UIKit

class BaseViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewControllers = [
            creatViewController(viewController: TodayViewController(), imgPath: Constants.today, navTitle: "Today"),
            creatViewController(viewController: AppsBaseCollectionViewController(), imgPath: Constants.apps, navTitle: "Apps"),
            creatViewController(viewController: AppSearchController(), imgPath: Constants.search, navTitle: "Search")
        ]
        
    }
    
    fileprivate func creatViewController(viewController: UIViewController, imgPath icon: String, navTitle: String) -> UIViewController
    {
        let navController = UINavigationController(rootViewController: viewController)
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = navTitle
    
        navController.tabBarItem.image = UIImage(named: icon)
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = navTitle
        
        return navController
    }


}
