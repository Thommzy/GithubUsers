//
//  RealmManager.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/15/22.
//

import Foundation
import RealmSwift

class PersistenceManager: PersistenceProtocol {
    
    private let realm = try! Realm()
    var instance: Realm {
        return realm
    }
    
    func saveObject<T>(_ object: T) where T : Object {
        try! self.realm.write {
            self.realm.add(object, update: .all)
        }
    }
    
    func fetchObjects(_ type: Object.Type) -> [Object]? {
        let results = realm.objects(type)
        return Array(results)
    }
}
