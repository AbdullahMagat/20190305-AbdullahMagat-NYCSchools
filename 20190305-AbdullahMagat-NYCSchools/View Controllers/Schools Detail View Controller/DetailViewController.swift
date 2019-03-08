//
//  DetailViewController.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import UIKit
import MessageUI

class DetailViewController: UIViewController {
    //MARK: IBOutlest
    @IBOutlet var backView: UIView!
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var mathScore: UILabel!
    @IBOutlet weak var readingScore: UILabel!
    @IBOutlet weak var writingScore: UILabel!
    @IBOutlet weak var mainView: UIView!
    var currentSchool : SchoolDetailModel!
    var latitude = ""
    var longitude = ""
    var schoolEmail = ""
    
    
    
    
    //MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setWithSchoolDetail(_ model: SchoolDetailModel) {
        schoolName.text = model.schoolName
        mathScore.text = "Math Score is:" + model.mathScore
        readingScore.text = "Reading Score is:" + model.readingScore
        writingScore.text = "Writing Score is:" + model.writingScore
        schoolName.adjustsFontSizeToFitWidth = true
    }
    //MARK: IBActions to send email and get directions
    @IBAction func getContactWithSchool(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
            mail.setToRecipients(["\(schoolEmail)"])
            mail.setMessageBody("<p></p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            print("mail could not be sent")        }
        
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true)
    }
    
    @IBAction func getDirectionsToSchool(_ sender: Any) {
        let lat = latitude
        let lon = longitude
        if (UIApplication.shared.canOpenURL(NSURL(string:"https://maps.google.com")! as URL))
        {
            let url = NSURL(string:
                "https://maps.google.com/?q=\(lat),\(lon)")! as URL
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}



//MARK: Setup Methods
extension DetailViewController {
    private func setupUI(){
        backView.setShadow()
    }
}



//MARK: Custom Init Method
extension DetailViewController {
    
    static func instantiate(dbn: String)-> DetailViewController{
        let vc = UINib(nibName: "DetailViewController", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! DetailViewController
        //        vc.loadSchoolDetail(withSchoolName: schoolName)
        return vc
        
    }
    
}

