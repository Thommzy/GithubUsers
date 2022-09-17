//
//  UserDetailConfigurator.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/17/22.
//

import Foundation

class UserDetailConfigurator: UserDetailConfiguratorProtocol {
    func configure(with viewController: UserDetailViewController) {
        let presenter = UserDetailPresenter(view: viewController)
        let interactor = UserDetailInteractor(presenter: presenter)
        let router = UserDetailRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
