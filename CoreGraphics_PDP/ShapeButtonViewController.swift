//
//  ShapeButtonViewController.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 17.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class ShapeButtonViewController: UIViewController {

    @IBOutlet weak var shapeButton: ShapeButton!
    
    private var flag: Bool = false
    
    @IBAction func shapeButtonDidClicked(sender: ShapeButton) {
        
        let animation = CABasicAnimation(keyPath: "path")
        
        if self.flag {
            animation.fromValue = UIBezierPath(ovalInRect: self.shapeButton.bounds).CGPath
            animation.toValue = UIBezierPath(rect: self.shapeButton.bounds).CGPath
        } else {
            animation.fromValue = UIBezierPath(rect: self.shapeButton.bounds).CGPath
            animation.toValue = UIBezierPath(ovalInRect: self.shapeButton.bounds).CGPath
        }
        
        animation.fillMode = kCAFillModeForwards
        animation.duration = 1.0
        animation.delegate = self
        animation.removedOnCompletion = false
        self.shapeButton.layer.addAnimation(animation, forKey: "path")
        self.flag = !self.flag
    }

}
