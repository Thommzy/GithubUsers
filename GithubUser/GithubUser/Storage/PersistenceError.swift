//
//  PersistenceError.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/15/22.
//

import Foundation

struct PersistenceError: Error {
    
    enum ErorsCodes: Int {
        case objectMissing = 0
        
        func getDescription() -> String {
            switch self {
            case .objectMissing:
                return "Realm object is missing"
            }
        }
    }
    
    var code: Int
    var description: String
}
