//
//  ViewController.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var viewContainer: UIView!
    var schoolsInList : UIView!
    var schoolsInMap : UIView!
    var listView : ListView?
    var mapsView : MapsView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        mapsView?.schoolsLocationArray =
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setInitialSubviews()
        
    }
    
    
    private func setInitialSubviews(){
        
        mapsView = MapsView()
        schoolsInMap = MapsView().view
        listView = ListView()
        schoolsInList = listView?.view
        viewContainer.addSubview(schoolsInMap)
        viewContainer.addSubview(schoolsInList)
        
    }
    
    
    @IBAction func switchViewAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            viewContainer.bringSubviewToFront(schoolsInList)
            
        case 1:
            viewContainer.bringSubviewToFront(schoolsInMap)
            
        default:
            break
        }
        
        
    }
}
