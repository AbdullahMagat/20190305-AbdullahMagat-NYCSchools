//
//  ListView.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import UIKit


class ListView: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var schoolSearchBar: UISearchBar!
    @IBOutlet weak var schoolsTableView: UITableView!
    private var isSearching : Bool = false
    private var textFieldInsideSearchBar:UITextField?
    private var currentPage = 1
    private var currentQuery = ""
    fileprivate var schoolsList = [SchoolModel]()
    
    //    Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.schoolsTableView?.register(UITableViewCell.self, forCellReuseIdentifier: "SchoolTableViewCell")
        schoolsTableView.delegate = self
        schoolsTableView.dataSource = self
        loadSchoolList()
        
    }
    
}

//MARK: API CALL TO LOAD SCHOOL LIST
extension ListView{
    func loadSchoolList() {
        
        ApiManager.shared.getSchoolsList { (error, model) in
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
                } else if let temp = model as? [SchoolModel] {
                    self.schoolsList.removeAll()
                    self.schoolsList.append(contentsOf: temp)
                    
                    self.schoolsTableView.reloadData()
                }
            }
        }
    }
}


//MARK: Helper Methods
extension ListView{
    func loadSingleSchoolDetail(dbn: String , latitude: String , longitude: String, email: String) {
        
        let detailVC = DetailViewController.instantiate(dbn: dbn)
        detailVC.latitude = latitude
        detailVC.longitude = longitude
        detailVC.schoolEmail = email
        
        ApiManager.shared.getSchoolDetail(dbn:dbn ,   completion: { (error, model) in
            DispatchQueue.main.async { [weak self] in
                
                if let error = error as? ServerError {
                    if !error.message.contains("JSON could not be") {
                        self?.present(AlertHelper.shared.alertErrorWith(title: nil,
                                                                        message: error.message,
                                                                        okAction: nil),
                                      animated: true,
                                      completion: nil)
                    }
                } else if let currentSchool = model as? SchoolDetailModel {
                    detailVC.setWithSchoolDetail(currentSchool)
                    self!.present(detailVC, animated: true, completion: nil)
                    
                }
            }
        })
        
        
    }
}

//MARK: UITableview Datasource and Delegates
extension ListView: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  Bundle.main.loadNibNamed("SchoolTableViewCell", owner: self, options: nil)?.first as! SchoolTableViewCell
        cell.selectionStyle = .none
        let currentModel = schoolsList[indexPath.item]
        
        cell.setWithSchool(currentModel)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentModel = schoolsList[indexPath.row]
        loadSingleSchoolDetail(dbn: currentModel.dbn, latitude: currentModel.latitude , longitude: currentModel.longitude , email: currentModel.schoolEmail )
        
    }
    
}
