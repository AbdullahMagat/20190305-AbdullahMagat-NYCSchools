//
//  MapsModel.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import Foundation
import ObjectMapper

class MapsModel: BaseModel {
    var schoolName = ""
    var latitude = ""
    var longitude = ""
    
    
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        schoolName <- map["school_name"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        
        
        
    }
}
