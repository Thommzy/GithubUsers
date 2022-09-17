//
//  UIViewController+Extension.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/17/22.
//

import Foundation
import UIKit

extension UIViewController {
    func customAlert(error: String) {
        let alertController = UIAlertController(title: AppString.emptyString.localisedValue, message: error, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default) { _ in })
        DispatchQueue.main.async {
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
