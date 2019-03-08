//
//  SchoolTableViewCell.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import UIKit

class SchoolTableViewCell: UITableViewCell {
    
    @IBOutlet weak var schoolName: UILabel!
    
    @IBOutlet weak var schoolWebsite: UILabel!
    
    @IBOutlet weak var schoolsCity: UILabel!
    
    @IBOutlet weak var schoolsLocation: UILabel!
    
    var latitude = ""
    var longitude = ""
    var schoolEmail = ""
    var dbn = ""
    
    static let reuseIdentifier = "SchoolTableViewCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setWithSchool(_ model: SchoolModel) {
        schoolName.text = model.schoolName
        schoolWebsite.text = "Website: " + model.website
        schoolsCity.text = "City: " + model.city
        schoolsLocation.text = "Address: " + model.location
        latitude = model.latitude
        longitude = model.longitude
        schoolEmail = model.schoolEmail
        dbn = model.dbn
        schoolName.adjustsFontSizeToFitWidth = true
        schoolWebsite.adjustsFontSizeToFitWidth = true
        schoolsLocation.adjustsFontSizeToFitWidth = true
        schoolsCity.adjustsFontSizeToFitWidth = true
        
    }
    
}


