//
//  FavPresenter.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/17/22.
//

import Foundation
import RealmSwift

class FavPresenter {
    weak var view: FavViewControllerProtocol!
    var interactor: FavInteractorProtocol!
    var router: FavRouterProtocol!
    
    required init(view: FavViewControllerProtocol) {
        self.view = view
    }
}

extension FavPresenter: FavPresenterProtocol {
    func didTapCell(indexPath: IndexPath) {
        router.displayDetailScreen(item: view.userArr[indexPath.row])
    }
    
    func triggerFavData() {
        interactor.getAllFav()
    }
    
    func getAllFav(item: [Object]) {
        let item = item as! [UserRealm]
        self.view.userArr = item
        self.view.favTableView.reloadData()
    }
}
