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
        self.viewController.customAlert(error: error)
    }
}
