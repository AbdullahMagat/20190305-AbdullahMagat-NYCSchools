//
//  SchoolModel.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import Foundation
import ObjectMapper

class SchoolModel: BaseModel {
    var schoolName = ""
    var city = ""
    var website = ""
    var location = ""
    var latitude = ""
    var longitude = ""
    var schoolEmail = ""
    var dbn = ""
    
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        schoolName <- map["school_name"]
        city <- map["city"]
        website <- map["website"]
        location <- map["location"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        schoolEmail <- map["school_email"]
        dbn <- map["dbn"]
        
        
    }
}

