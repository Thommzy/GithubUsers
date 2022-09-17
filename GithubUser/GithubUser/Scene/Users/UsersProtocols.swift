//
//  UsersProtocols.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/13/22.
//

import UIKit
import RealmSwift

protocol UserViewControllerProtocol: AnyObject {
    var userTableView: UITableView { get }
    var loader: UIActivityIndicatorView { get }
    var spinner: UIActivityIndicatorView { get }
    var refreshContol: UIRefreshControl { get }
    var userArr: [UserRealm] {set get }
    var isLoading: Bool { set get }
}

protocol UsersInteractorProtocol: AnyObject {
    func getUsers(q: String)
    func checkRealmDBOnViewDidLoad()
}

protocol UserPresenterProtocol: AnyObject {
    var router: UserRouterProtocol! { set get }
    func triggerUsers()
    func allUsers(item: [Object])
    func displayError(error: String)
    func bottomDetected()
    func setupSpinner()
    func handleRefresh()
    func didTapCell(indexPath: IndexPath)
    func checkRealmDBOnViewDidLoad()
}

protocol UserRouterProtocol: AnyObject {
    func displayError(error: String)
    func displayDetailScreen(item: UserRealm)
}

protocol UserConfigurationProtocol: AnyObject {
    func configure(with viewController: UsersViewController)
}
