//
//  GenericError.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import Foundation

class GenericError: Error {
    var message: String
    
    init(message: String) {
        self.message = message
    }
}
