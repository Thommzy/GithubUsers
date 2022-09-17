//
//  BaseViewController.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/17/22.
//

import UIKit

class BaseViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVCs()
    }
    
    func setupVCs() {
        let usersImage = UIImage(
            systemName: AppString.usersIcon.localisedValue,
            withConfiguration:UIImage.SymbolConfiguration(
                weight: .bold
            )
        )?.withTintColor(
            .label,
            renderingMode: .alwaysOriginal
        )
        let favImage = UIImage(
            systemName: AppString.favIcon.localisedValue,
            withConfiguration:UIImage.SymbolConfiguration(
                weight: .bold
            )
        )?.withTintColor(
            .label,
            renderingMode: .alwaysOriginal
        )
        viewControllers = [
            createNavController(
                for: UsersViewController(),
                title: AppString.users.localisedValue,
                image: usersImage!),
            createNavController(
                for: FavViewController(),
                title: AppString.fav.localisedValue,
                image: favImage!)
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}
