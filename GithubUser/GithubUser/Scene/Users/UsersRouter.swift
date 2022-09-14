//
//  UsersRouter.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/13/22.
//

import Foundation

class UsersRouter {
    weak var viewController: UsersViewController!
    
    init(viewController: UsersViewController) {
        self.viewController = viewController
    }
}

extension UsersRouter: UserRouterProtocol {
    
}
