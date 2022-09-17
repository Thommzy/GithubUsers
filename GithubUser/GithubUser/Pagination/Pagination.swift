//
//  Pagination.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/16/22.
//

import Foundation
import RealmSwift

protocol PaginationProtocol: AnyObject {
    func paginate(data: [Object]?) -> Int
}

class Pagination: PaginationProtocol {
    func paginate(data: [Object]?) -> Int {
        let data = data as? [UserRealm]
        let unwrappedData = data ?? []
        let unwrappedDataCount = unwrappedData.count
        let nextPage = unwrappedDataCount == 0
        ? 1
        : unwrappedData[unwrappedData.count - 1].currentPage + 1
        return nextPage
    }
}
