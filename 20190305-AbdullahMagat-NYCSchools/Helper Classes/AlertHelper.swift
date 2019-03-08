//
//  AlertHelper.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import Foundation
import UIKit

typealias AlertCompletionBlock = () -> ()

class AlertHelper {
    static let shared = AlertHelper()
    
    func alertErrorWith(title: String?, message: String?, okAction: AlertCompletionBlock? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            if let completion = okAction {
                completion()
            }
        }))
        return alertController
    }
}

