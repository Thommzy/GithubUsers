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
    
    func saveObjects<T>(_ objects: [T]) where T: Object
    func saveObject<T>(_ object: T) where T: Object
    
    func fetchObjects(_ type: Object.Type) -> [Object]?
    func fetchObjects<T>(_ type: T.Type, predicate: NSPredicate) -> [T]? where T: Object
    
    func updateObjects<T>(_ objects: [T]) throws where T: Object
    func updateObject<T>(_ object: T) throws where T: Object
    
    func removeObjects<T>(_ objects: [T]) where T: Object
    func removeObject<T>(_ object: T) where T: Object
    func removeAllObjectsOfType<T>(_ type: T.Type) where T: Object
    
    func removeAll()
}
