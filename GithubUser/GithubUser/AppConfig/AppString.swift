//
//  AppString.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/13/22.
//

import Foundation

public enum AppString:String {
    public var localisedValue:String {
        return self.rawValue.getLocalizedValue()
    }
    
    case homeTitle
    case https
    case baseURL
    case usersPath
    case q
    case page
    case lagos
}
