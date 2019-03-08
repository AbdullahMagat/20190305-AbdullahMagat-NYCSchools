//
//  UIViewDesignHelper.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class GeneralPageDesign: UIView{
    @IBInspectable var topcolor : UIColor = UIColor.blue {
        didSet {
            self.setNeedsLayout()
        }
    }
    @IBInspectable var bottoncolor : UIColor = UIColor.green {
        didSet {
            self.setNeedsLayout()
        }
    }
    @IBInspectable var middlecolor : UIColor = UIColor.white {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.cornerRadius = 25
        gradientLayer.opacity = 0.5
        gradientLayer.colors = [topcolor.cgColor , middlecolor.cgColor, bottoncolor.cgColor]
        gradientLayer.startPoint = CGPoint(x : 0 , y:0)
        gradientLayer.endPoint = CGPoint(x:1 , y:1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
}
