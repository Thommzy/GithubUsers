//
//  UserRealm.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/15/22.
//

import Foundation
import RealmSwift

// MARK: - UsersRealm
//class UsersRealm: Object {
//    @Persisted var id = 0
//    var items = List<UserRealm>()
//}

class UserRealm: Object {
    @objc dynamic var id = 0
    @objc dynamic var login: String? = nil
    @objc dynamic var avatarURL: String? = nil
    @objc dynamic var isfavourited: Bool = false
    @objc dynamic var currentPage = 0
    @objc dynamic var html_url: String? = nil
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

extension UserRealm {
    var loginFirstLetter: String {
        return String(self.login![self.login!.startIndex]).uppercased()
    }
}
