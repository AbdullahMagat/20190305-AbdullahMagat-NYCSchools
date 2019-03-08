//
//  ApiManager.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
import Alamofire

typealias APICompletionBlock = (Error?) -> Void
typealias APICompletionDataBlock = (Error?, Data?) -> Void
typealias APICompletionModelBlock = (Error?, BaseModel?) -> Void
typealias APICompletionArrayBlock = (Error?, [BaseModel]?) -> Void
var mapsList = [[String:Any]]()

class ApiManager: NSObject {
    static let shared = ApiManager()
}

extension ApiManager {
    
    // MARK: - GET REQUESTS TO LOAD THE TABLE VIEW , MAPS VIEW AND DETAIL VIEW
    func getSchoolsList(completion: @escaping APICompletionArrayBlock) {
        let fullUrlString = BASE_URL + GET_SCHOOLS_LIST
        if let url = URL(string: fullUrlString) {
            RequestManager.shared.fetchDataWith(url: url, method: .get, params: nil, shouldAuth: false, completion: { (error, responseJSON, response) in
                if let error = error {
                    completion(error, nil)
                } else if let responseJSON = responseJSON as? [[String: Any]] {
                    let schoolsList = Mapper<SchoolModel>().mapArray(JSONArray: responseJSON)
                    completion(nil, schoolsList)
                } else {
                    completion(nil, nil)
                }
            })
        }
    }
    
    func getSchoolsLocationList(completion: @escaping APICompletionArrayBlock) {
        let fullUrlString = BASE_URL + GET_SCHOOLS_LIST
        if let url = URL(string: fullUrlString) {
            RequestManager.shared.fetchDataWith(url: url, method: .get, params: nil, shouldAuth: false, completion: { (error, responseJSON, response) in
                if let error = error {
                    completion(error, nil)
                } else if let responseJSON = responseJSON as? [[String: Any]] {
                    let schoolsLocationList = Mapper<MapsModel>().mapArray(JSONArray: responseJSON)
                    completion(nil, schoolsLocationList)
                } else {
                    completion(nil, nil)
                }
            })
        }
    }
    
    func getSchoolDetail(dbn: String, completion: @escaping APICompletionModelBlock) {
        let fullUrlString = BASE_URL + GET_SCHOOL_DETAIL + dbn
        if let url = URL(string: fullUrlString) {
            RequestManager.shared.fetchDataWith(url: url, method: .get, params: nil, shouldAuth: false, completion: { (error, responseJSON, response) in
                if let error = error {
                    completion(error, nil)
                } else if let responseJSON = responseJSON as? [[String: Any]] {
                    if responseJSON.count != 0 {
                        let school = Mapper<SchoolDetailModel>().map(JSON: responseJSON[0])
                        completion(nil, school)
                        
                    }else {
                        let error = ServerError.init(code: 505, message: "Sorry! Couldn't find detail for this school. Please try other schools")
                        completion(error, nil)
                        
                    }
                } else {
                    completion(nil, nil)
                }
            })
        }
    }
}
