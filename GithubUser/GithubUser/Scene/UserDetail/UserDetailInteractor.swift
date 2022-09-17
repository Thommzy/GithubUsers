//
//  UserDetailInteractor.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/17/22.
//

import Foundation

class UserDetailInteractor {
    
    weak var presenter: UserDetailPresenterProtocol!
    let persistenceManager: PersistenceProtocol = PersistenceManager()
    
    required init(presenter: UserDetailPresenterProtocol) {
        self.presenter = presenter
    }
}

extension UserDetailInteractor: UserDetailInteractorProtocol {
    func likeUser(user: UserRealm, isFaved: Bool) {
        customAddObject(user: user, isLiked: isFaved)
    }
    
    func unLikeUser(user: UserRealm, isFaved: Bool) {
        customAddObject(user: user, isLiked: isFaved)
    }
    
    func customAddObject(user: UserRealm, isLiked: Bool) {
        let userRealm = UserRealm()
        userRealm.login = user.login
        userRealm.isfavourited = isLiked
        userRealm.id = user.id
        userRealm.currentPage = user.currentPage
        userRealm.avatarURL = user.avatarURL
        userRealm.html_url = user.html_url
        persistenceManager.saveObject(userRealm)
    }
}
