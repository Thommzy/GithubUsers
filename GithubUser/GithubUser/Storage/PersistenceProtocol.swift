//
//  PersistenceProtocol.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/15/22.
//

import Foundation
import RealmSwift

protocol PersistenceProtocol {
    var instance: Realm { get }
    func saveObject<T>(_ object: T) where T: Object
    func fetchObjects(_ type: Object.Type) -> [Object]?
}
