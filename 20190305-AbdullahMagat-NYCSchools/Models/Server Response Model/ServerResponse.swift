//
//  ServerResponse.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import UIKit
import ObjectMapper

public enum ResponseStatus {
    case success
    case failure
}

class ServerResponse: BaseModel {
    
    var code: Int!
    var status: ResponseStatus!
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        code           <- map["code"]
        status         <- (map["status"], ResponseStatusTransfrom())
    }
}
