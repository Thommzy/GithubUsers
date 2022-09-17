//
//  UserDetailRouter.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/17/22.
//

import UIKit

class UserDetailRouter {
    weak var viewController: UserDetailViewController!
    
    init(viewController: UserDetailViewController) {
        self.viewController = viewController
    }
}

extension UserDetailRouter: UserDetailRouterProtocol {
    func displayBookMarkedAlert(message: String) {
        self.viewController.customAlert(error: message)
    }
}
