//
//  MapsViewAnntationCell.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import Foundation
class MapsViewAnntationCell {
    var schoolName = ""
    var latitude = ""
    var longitude = ""
    
    
    func setWithSchool(_ model: MapsModel) {
        schoolName = model.schoolName
        latitude = model.latitude
        longitude = model.longitude
    }
}
