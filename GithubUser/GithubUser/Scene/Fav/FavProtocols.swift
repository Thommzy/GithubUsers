//
//  FavProtocols.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/17/22.
//

import UIKit
import RealmSwift

protocol FavViewControllerProtocol: AnyObject {
    var favTableView: UITableView { get }
    var userArr: [UserRealm] {set get }
}

protocol FavInteractorProtocol: AnyObject {
    func getAllFav()
}

protocol FavPresenterProtocol: AnyObject {
    var router: FavRouterProtocol! { set get }
    func getAllFav(item: [Object])
    func triggerFavData()
    func didTapCell(indexPath: IndexPath)
}

protocol FavRouterProtocol: AnyObject {
    func displayDetailScreen(item: UserRealm)
}

protocol FavConfigurationProtocol: AnyObject {
    func configure(with viewController: FavViewController)
}
