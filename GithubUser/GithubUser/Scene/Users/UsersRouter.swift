//
//  UsersRouter.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/13/22.
//

import UIKit

class UsersRouter {
    weak var viewController: UsersViewController!
    
    init(viewController: UsersViewController) {
        self.viewController = viewController
    }
}

extension UsersRouter: UserRouterProtocol {
    func displayDetailScreen(item: UserRealm) {
        let detailVc = UserDetailViewController()
        detailVc.item = item
        self.viewController.navigationController?.pushViewController(detailVc, animated: true)
    }
    
    func displayError(error: String) {
        let alertController = UIAlertController(title: AppString.emptyString.localisedValue, message: error, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
            
        })
        DispatchQueue.main.async {
            self.viewController.present(alertController, animated: true, completion: nil)
        }
    }
}
