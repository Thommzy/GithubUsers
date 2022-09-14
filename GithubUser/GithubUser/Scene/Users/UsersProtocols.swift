//
//  UsersProtocols.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/13/22.
//

import Foundation

protocol UserViewControllerProtocol: AnyObject {
}

protocol UsersInteractorProtocol: AnyObject {
    func getUsers(q: String, page: Int)
}

protocol UserPresenterProtocol: AnyObject {
    var router: UserRouterProtocol! { set get }
    func triggerUsers(q: String, page: Int)
}

protocol UserRouterProtocol: AnyObject {
}

protocol UserConfigurationProtocol: AnyObject {
    func configure(with viewController: UsersViewController)
}
