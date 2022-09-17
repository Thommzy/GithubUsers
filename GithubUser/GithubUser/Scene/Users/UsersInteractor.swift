//
//  UsersInteractor.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/13/22.
//

import UIKit
import RealmSwift

class UsersInteractor {
    
    weak var presenter: UserPresenterProtocol!
    var usersNetworkService: UsersNetworkServiceProtocol = UsersNetworkService()
    let persistenceManager: PersistenceProtocol = PersistenceManager()
    let pagination: PaginationProtocol = Pagination()
    
    required init(presenter: UserPresenterProtocol) {
        self.presenter = presenter
    }
}

extension UsersInteractor: UsersInteractorProtocol {
    func retrieveDataFromDB() -> [UserRealm]? {
        let data = persistenceManager.fetchObjects(UserRealm.self) as? [UserRealm]
        return data
    }
    
    func checkRealmDBOnViewDidLoad() {
        let data = persistenceManager.fetchObjects(UserRealm.self) as? [UserRealm]
        guard let isEmpty = data?.isEmpty else { return }
        if isEmpty {
            presenter.triggerUsers()
        } else {
            self.presenter.allUsers(item: retrieveDataFromDB() ?? [])
        }
    }
    
    func getUsers(q: String) {
        let data = persistenceManager.fetchObjects(UserRealm.self) as? [UserRealm]
        let nextPage = pagination.paginate(data: data)
        usersNetworkService.getUser(q: q, page: nextPage) { [weak self] result in
            switch result {
            case .success(let users):
                for item in users.items {
                    let userRealm = UserRealm()
                    userRealm.id = item.id ?? 0
                    userRealm.login = item.login
                    userRealm.avatarURL = item.avatarURL
                    userRealm.isfavourited = item.isfavourited ?? Bool()
                    userRealm.currentPage = nextPage
                    userRealm.html_url = item.htmlURL
                    self?.persistenceManager.saveObject(userRealm)
                }
                self?.presenter.allUsers(item: self?.retrieveDataFromDB() ?? [])
                break
            case .failure(let error):
                if !error.localizedDescription.contains("connection is not currently allowed") {
                    self?.presenter.allUsers(item: self?.retrieveDataFromDB() ?? [])
                }
                self?.presenter.displayError(error: error.localizedDescription)
                break
            }
        }
    }
}
