//
//  MapsView.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import UIKit
import MapKit
class MapsView: UIViewController {
    fileprivate  var schoolsLocationList = [MapsModel]()
    
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loadSchoolsLocationList()
        let newYorkLatitude = 40.730610
        let newYorkLongitude = -73.935242
        let newYorkCoordinates = CLLocationCoordinate2D(latitude: newYorkLatitude , longitude: newYorkLongitude )
        let viewRegion = MKCoordinateRegion(center: newYorkCoordinates , latitudinalMeters: 50000,longitudinalMeters: 50000)
        self.mapView.setRegion(viewRegion, animated: true)
        
    }
    func createAnnotations(schoolsLocations: [MapsViewAnntationCell]){
        for location in schoolsLocations{
            let annotations = MKPointAnnotation()
            annotations.title = location.schoolName
            let latitude = (location.latitude as NSString).doubleValue
            let longitude = (location.longitude as NSString).doubleValue
            annotations.coordinate = CLLocationCoordinate2D(latitude: latitude , longitude: longitude )
            mapView.addAnnotation(annotations)
            
        }
        
        
        
    }
    
    
}


//MARK: API CALL TO LOAD SCHOOL LIST
extension MapsView{
    func loadSchoolsLocationList() {
        
        ApiManager.shared.getSchoolsLocationList { (error, model) in
            DispatchQueue.main.async {
                if let error = error as? ServerError {
                    if(error.message.contains("Sorry! Couldn't find detail for this school. Please try other schools")){
                        self.present(AlertHelper.shared.alertErrorWith(title: "Oooops!",
                                                                       message: error.message,
                                                                       okAction: nil),
                                     animated: true,
                                     completion: nil)
                        
                    }else if !error.message.contains("JSON could not be") {
                        self.present(AlertHelper.shared.alertErrorWith(title: nil,
                                                                       message: error.message,
                                                                       okAction: nil),
                                     animated: true,
                                     completion: nil)
                    }
                } else if let temp = model as? [MapsModel] {
                    self.schoolsLocationList.removeAll()
                    self.schoolsLocationList.append(contentsOf: temp)
                    var locationArray = [MapsViewAnntationCell]()
                    
                    for location in self.schoolsLocationList{
                        let annotation = MapsViewAnntationCell()
                        annotation.setWithSchool(location)
                        locationArray.append(annotation)
                    }
                    self.createAnnotations(schoolsLocations: locationArray)
                }
            }
        }
    }
}
