//
//  BaseModel.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import UIKit
import ObjectMapper

class BaseModel: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        // no implementation. This function will be overriden by children
    }
}
