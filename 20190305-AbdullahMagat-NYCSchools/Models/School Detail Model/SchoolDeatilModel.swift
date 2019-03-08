//
//  SchoolDeatilModel.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import Foundation
import ObjectMapper

class SchoolDetailModel: BaseModel {
    var schoolName = ""
    var writingScore = ""
    var mathScore  = ""
    var readingScore = ""
    
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        schoolName <- map["school_name"]
        writingScore <- map["sat_writing_avg_score"]
        mathScore <- map["sat_math_avg_score"]
        readingScore <- map["sat_critical_reading_avg_score"]
        
    }
}
