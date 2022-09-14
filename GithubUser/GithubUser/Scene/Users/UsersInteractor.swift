//
//  UsersInteractor.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/13/22.
//

import Foundation

class UsersInteractor {
    
    weak var presenter: UserPresenterProtocol!
    var usersNetworkService: UsersNetworkServiceProtocol = UsersNetworkService()
    //    let storageService: LocalStorageHandlerProtocol = LocalStorageHandler()
    
    required init(presenter: UserPresenterProtocol) {
        self.presenter = presenter
    }
}


extension UsersInteractor: UsersInteractorProtocol {
    func getUsers(q: String, page: Int) {
        usersNetworkService.getUser(
            q: q ?? "",
            page: page ?? 0) { result in
                switch result {
                case .success(let users):
                    debugPrint("users-->>>", users)
                    break
                case .failure(let error):
                    debugPrint("error-->>", error)
                    break
                }
            }
    }
}
