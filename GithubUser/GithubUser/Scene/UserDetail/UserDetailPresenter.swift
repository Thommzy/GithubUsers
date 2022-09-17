//
//  UserDetailPresenter.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/17/22.
//

import Foundation
import RealmSwift

class UserDetailPresenter {
    weak var view: UserDetailViewControllerProtocol!
    var interactor: UserDetailInteractorProtocol!
    var router: UserDetailRouterProtocol!
    
    required init(view: UserDetailViewControllerProtocol) {
        self.view = view
    }
}

extension UserDetailPresenter: UserDetailPresenterProtocol {
    func didSelectBookMark(isFaved: Bool) {
        guard let item = view.item  else { return }
        interactor.likeUser(user: item, isFaved: isFaved)
        router.displayBookMarkedAlert(message: AppString.favAdded.localisedValue)
    }
    
    func didDeSelectBookMark(isFaved: Bool) {
        guard let item = view.item  else { return }
        interactor.unLikeUser(user: item, isFaved: isFaved)
        router.displayBookMarkedAlert(message: AppString.favRemoved.localisedValue)
    }
}
