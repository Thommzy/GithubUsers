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
        let alertController = UIAlertController(title: AppString.emptyString.localisedValue, message    : message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
            
        })
        DispatchQueue.main.async {
            self.viewController.present(alertController, animated: true, completion: nil)
        }
    }
}
