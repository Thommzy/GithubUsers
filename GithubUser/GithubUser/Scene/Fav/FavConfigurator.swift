//
//  FavConfigurator.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/17/22.
//

import Foundation

class FavConfigurator: FavConfigurationProtocol {
    func configure(with viewController: FavViewController) {
        let presenter = FavPresenter(view: viewController)
        let interactor = FavInteractor(presenter: presenter)
        let router = FavRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
