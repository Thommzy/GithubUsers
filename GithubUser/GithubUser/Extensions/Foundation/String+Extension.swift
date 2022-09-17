//
//  String+Extension.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/13/22.
//

import Foundation

extension String {
    func getLocalizedValue() -> String{
        return NSLocalizedString(
            self,
            comment: ""
        )
    }
}
