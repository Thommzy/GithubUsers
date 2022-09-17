//
//  FavRouter.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/17/22.
//

import Foundation

class FavRouter {
    weak var viewController: FavViewController!
    
    init(viewController: FavViewController) {
        self.viewController = viewController
    }
}

extension FavRouter: FavRouterProtocol {
    func displayDetailScreen(item: UserRealm) {
        let detailVc = UserDetailViewController()
        detailVc.item = item
        self.viewController.navigationController?.pushViewController(detailVc, animated: true)
    }
}
