//
//  UsersViewController.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/13/22.
//

import UIKit

class UsersViewController: UIViewController {
    var presenter: UserPresenterProtocol!
    var configurator: UserConfigurationProtocol = UsersConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.triggerUsers(q: AppString.lagos.localisedValue, page: 0)
    }

}

extension UsersViewController: UserViewControllerProtocol {
    
}


private extension UsersViewController {
    func setupViews() {
        view.backgroundColor = .white
        title = AppString.homeTitle.localisedValue
    }
}
