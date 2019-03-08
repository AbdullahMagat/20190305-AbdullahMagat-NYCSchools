//
//  UIImageView+Extension.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import UIKit
import Foundation
// MARK: Helper function for animation
extension UIImageView {
    public func wiggle(){
        let wiggleAnim = CABasicAnimation(keyPath: "position")
        wiggleAnim.duration = 0.5
        wiggleAnim.repeatCount = 1000
        wiggleAnim.autoreverses = true
        wiggleAnim.fromValue = CGPoint(x: self.center.x-5, y: self.center.y)
        wiggleAnim.toValue = CGPoint(x: self.center.x+5, y: self.center.y)
        layer.add(wiggleAnim, forKey: "position")
        
    }
    
}
