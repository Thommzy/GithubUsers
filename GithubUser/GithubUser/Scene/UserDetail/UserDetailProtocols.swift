//
//  UserDetailProtocols.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/17/22.
//

import Foundation
import RealmSwift

protocol UserDetailViewControllerProtocol: AnyObject {
    var item: UserRealm? {set get }
}

protocol UserDetailInteractorProtocol: AnyObject {
    func likeUser(user: UserRealm, isFaved: Bool)
    func unLikeUser(user: UserRealm, isFaved: Bool)
}

protocol UserDetailPresenterProtocol: AnyObject {
    var router: UserDetailRouterProtocol! { set get }
    func didSelectBookMark(isFaved: Bool)
    func didDeSelectBookMark(isFaved: Bool)
}

protocol UserDetailConfiguratorProtocol: AnyObject {
    func configure(with viewController: UserDetailViewController)
}

protocol UserDetailRouterProtocol: AnyObject {
    func displayBookMarkedAlert(message: String)
}
