//
//  ObjectMapperTransformer.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import Foundation
import ObjectMapper

class ResponseStatusTransfrom: TransformType {
    typealias Object = ResponseStatus
    typealias JSON = Int
    
    init() {}
    
    func transformFromJSON(_ value: Any?) -> Object? {
        let code = value as! Int
        if 200..<300 ~= code {
            return .success
        } else {
            return .failure
        }
    }
    
    func transformToJSON(_ value: Object?) -> JSON? {
        return 0
    }
}


