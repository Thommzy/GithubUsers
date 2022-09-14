//
//  UsersNetworkService.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/13/22.
//

import Foundation

protocol UsersNetworkServiceProtocol {
    func getUser(q: String, page: Int, completion: @escaping (Result<User, Error>) -> Void)
}

class UsersNetworkService: UsersNetworkServiceProtocol {
    let service: NetworkServiceProtocol = NetworkService()
    
    func getUser(q: String,
                 page: Int,
                 completion: @escaping (Result<User, Error>) -> Void) {
        service.request(endpoint: .getAllUsers(
            q: q,
            page: page
        ), completion: completion)
    }
}
