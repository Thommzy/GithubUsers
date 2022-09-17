//
//  UsersPresenter.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/13/22.
//

import Foundation
import RealmSwift

class UsersPresenter {
    weak var view: UserViewControllerProtocol!
    var interactor: UsersInteractorProtocol!
    var router: UserRouterProtocol!
    
    required init(view: UserViewControllerProtocol) {
        self.view = view
    }
}

extension UsersPresenter: UserPresenterProtocol {
    func checkRealmDBOnViewDidLoad() {
        interactor.checkRealmDBOnViewDidLoad()
    }
    
    func didTapCell(indexPath: IndexPath) {
        router.displayDetailScreen(item: view.userArr[indexPath.row])
    }
    
    @objc func handleRefresh() {
        view.refreshContol.endRefreshing()
    }
    
    func setupSpinner() {
        view.userTableView.addSubview(view.refreshContol)
        view.refreshContol.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        view.spinner.color = .darkGray
        view.spinner.hidesWhenStopped = true
        view.userTableView.tableFooterView = view.spinner
    }
    
    func bottomDetected() {
        view.isLoading = true
        view.spinner.startAnimating()
        self.interactor.getUsers(q: AppString.lagos.localisedValue)
    }
    
    func displayError(error: String) {
        router.displayError(error: error)
        self.view.loader.stopAnimating()
        self.view.spinner.stopAnimating()
    }
    
    func allUsers(item: [Object]) {
        DispatchQueue.main.async { [weak self] in
            self?.view.loader.stopAnimating()
            let item = item as! [UserRealm]
            self?.view.isLoading = false
            self?.view.userArr = item
            self?.view.userTableView.reloadData()
        }
    }
    
    func triggerUsers() {
        DispatchQueue.main.async { [weak self] in
            self?.view.loader.startAnimating()
            self?.view.spinner.stopAnimating()
            self?.interactor.getUsers(q: AppString.lagos.localisedValue)
        }
    }
}
