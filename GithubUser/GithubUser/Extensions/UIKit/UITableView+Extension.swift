//
//  UITableView+Extension.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/14/22.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type, reuseIdentifier: String? = nil) {
        let reuseId = reuseIdentifier ?? "\(T.self)"
        self.register(T.self, forCellReuseIdentifier: reuseId)
    }
}
