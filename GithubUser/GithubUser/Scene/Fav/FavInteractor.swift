//
//  FavInteractor.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/17/22.
//

import Foundation

class FavInteractor {
    
    weak var presenter: FavPresenterProtocol!
    let persistenceManager: PersistenceProtocol = PersistenceManager()
    
    required init(presenter: FavPresenterProtocol) {
        self.presenter = presenter
    }
}

extension FavInteractor: FavInteractorProtocol {
    func getAllFav() {
        let data = persistenceManager.fetchObjects(UserRealm.self) as? [UserRealm]
        let filteredData = data?.map{
            $0.isfavourited == true ? $0 : nil}
            .compactMap{$0}
        presenter.getAllFav(item: filteredData ?? [])
    }
}
