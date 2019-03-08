//
//  ServerError.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import Foundation

class ServerError: GenericError {
    var code: Int
    
    init(code: Int, message: String) {
        self.code = code
        super.init(message: message)
    }
}
