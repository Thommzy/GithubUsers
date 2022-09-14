//
//  UsersPresenter.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/13/22.
//

import Foundation

class UsersPresenter {
    weak var view: UserViewControllerProtocol!
    var interactor: UsersInteractorProtocol!
    var router: UserRouterProtocol!
    
    required init(view: UserViewControllerProtocol) {
        self.view = view
    }
}

extension UsersPresenter: UserPresenterProtocol {
    func triggerUsers(q: String, page: Int) {
        interactor.getUsers(q: q, page: page)
    }
}
