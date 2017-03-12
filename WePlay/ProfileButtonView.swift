//
//  ProfileButtonView.swift
//  WePlay
//
//  Created by Vincent Liu on 3/9/17.
//  Copyright © 2017 WePlay. All rights reserved.
//

import UIKit

class ProfileButtonView: UIButton {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        let buttonColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        buttonColor.setFill()
        path.fill()
        
        let plusHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        let plusPath = UIBezierPath()
        
        plusPath.lineWidth = plusHeight
        
        plusPath.move(to: CGPoint(
            x:bounds.width/2 - plusWidth/2,
            y:bounds.height/2))
        
        plusPath.addLine(to: CGPoint(
            x:bounds.width/2 + plusWidth/2,
            y:bounds.height/2))
        
        UIColor.white.setStroke()
        
        plusPath.stroke()
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
