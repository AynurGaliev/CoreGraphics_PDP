//
//  TextViewController.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 18.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    @IBOutlet weak var textView: TextView!
    @IBOutlet weak var shapeTextView: ShapeTextView!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let bezierPath = NSString(string: "Text").bezierPath(UIFont(name: "Helvetica-Light", size: 150.0)!)
        bezierPath.centralizeInRect(self.shapeTextView.bounds)
        (self.shapeTextView.layer as! CAShapeLayer).path = bezierPath.CGPath
        (self.shapeTextView.layer as! CAShapeLayer).fillColor = UIColor.greenColor().CGColor
        (self.shapeTextView.layer as! CAShapeLayer).lineCap = kCALineCapRound
        (self.shapeTextView.layer as! CAShapeLayer).lineJoin = kCALineJoinRound
        
        let strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = NSNumber(double: 0.0)
        strokeAnimation.toValue = NSNumber(double: 1.0)
        strokeAnimation.duration = 8.0
        
        let widthAnimation = CABasicAnimation(keyPath: "lineWidth")
        widthAnimation.fromValue = NSNumber(double: 2.0)
        widthAnimation.toValue = NSNumber(double: 5.0)
        widthAnimation.duration = 8.0
        
        let colorAnimation = CABasicAnimation(keyPath: "strokeColor")
        colorAnimation.fromValue = UIColor.blueColor().CGColor
        colorAnimation.toValue = UIColor.redColor().CGColor
        colorAnimation.duration = 8.0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [strokeAnimation, widthAnimation, colorAnimation]
        animationGroup.duration = 8.0
        animationGroup.fillMode = kCAFillModeForwards
        animationGroup.removedOnCompletion = false
        
        (self.shapeTextView.layer as! CAShapeLayer).addAnimation(animationGroup, forKey: nil)
    }
}
