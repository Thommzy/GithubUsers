//
//  Endpoint.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/13/22.
//

import Foundation

protocol EndpointProtocol {
    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var parameters: [URLQueryItem]? { get }
    var method: String { get }
}

enum Endpoint: EndpointProtocol {
    
    case getAllUsers(
        q: String?,
        page: Int?
    )
    
    var scheme: String {
        switch self {
        default:
            return AppString.https.localisedValue
        }
    }
    
    var baseURL: String {
        switch self {
        case .getAllUsers(
            q: _,
            page: _
        ):
            return AppString.baseURL.localisedValue
        }
    }
    
    var path: String {
        switch self {
        case .getAllUsers(
            q: _,
            page: _
        ):
            return AppString.usersPath.localisedValue
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .getAllUsers(
            let q,
            let page
        ):
            return [
                URLQueryItem(
                    name: AppString.q.localisedValue,
                    value: q
                ),
                URLQueryItem(
                    name: AppString.page.localisedValue,
                    value: String(page ?? 0)
                )
            ]
        }
    }
    
    var method: String {
        switch self {
        default:
            return "GET"
        }
    }
    
}
