//
//  ShapeViewController.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 15.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class ShapeViewController: UIViewController {

   @IBOutlet weak var shapeView: GradientButton!
    
    override func viewDidAppear(animated: Bool) {

        super.viewDidAppear(animated)
        
//        self.shapeView = GradientButton(frame: CGRectMake(50, 50, 200, 200))
//        self.shapeView.setTitle("Press me!", forState: UIControlState.Normal)
//        self.view.addSubview(self.shapeView)
        self.shapeView.layer.setNeedsDisplay()
//        let layer = shapeView.layer as! CAShapeLayer
//        layer.path = UIBezierPath(ovalInRect: self.shapeView.bounds).CGPath
//        layer.lineWidth = 4
//        layer.strokeColor = UIColor.redColor().CGColor
//        layer.fillColor = UIColor.yellowColor().CGColor
//        
//        layer.masksToBounds = false
//        layer.shadowColor = UIColor.blackColor().CGColor
//        layer.shadowOffset = CGSizeMake(10, 10)
//        layer.shadowPath = layer.path
//        layer.shadowRadius = 5
//        layer.shadowOpacity = 0.5
//        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(5.0*Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
//            
//            let animation = CABasicAnimation()
//            animation.delegate = self
//            animation.keyPath = "path"
//            animation.fromValue = UIBezierPath(ovalInRect: self.shapeView.bounds).CGPath
//            animation.toValue = UIBezierPath(rect: self.shapeView.bounds).CGPath
//            animation.duration = 3.0
//            self.shapeView.layer.addAnimation(animation, forKey: "path")
//            
//            let shadowAnimation = CABasicAnimation()
//            shadowAnimation.delegate = self
//            shadowAnimation.keyPath = "shadowPath"
//            shadowAnimation.fromValue = UIBezierPath(ovalInRect: self.shapeView.bounds).CGPath
//            shadowAnimation.toValue = UIBezierPath(rect: self.shapeView.bounds).CGPath
//            shadowAnimation.duration = 3.0
//            self.shapeView.layer.addAnimation(shadowAnimation, forKey: "shadowPath")
//            
//        });
    }

    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        (self.shapeView.layer as! CAShapeLayer).path = UIBezierPath(rect: self.shapeView.bounds).CGPath
        (self.shapeView.layer as! CAShapeLayer).shadowPath = UIBezierPath(rect: self.shapeView.bounds).CGPath
    }
}
