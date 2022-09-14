//
//  UsersConfigurator.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/13/22.
//

import Foundation

class UsersConfigurator: UserConfigurationProtocol {
    func configure(with viewController: UsersViewController) {
        let presenter = UsersPresenter(view: viewController)
        let interactor = UsersInteractor(presenter: presenter)
        let router = UsersRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
