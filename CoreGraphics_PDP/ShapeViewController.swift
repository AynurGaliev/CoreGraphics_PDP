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
    
        self.shapeView.layer.setNeedsDisplay()
    }

    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        (self.shapeView.layer as! CAShapeLayer).path = UIBezierPath(rect: self.shapeView.bounds).CGPath
        (self.shapeView.layer as! CAShapeLayer).shadowPath = UIBezierPath(rect: self.shapeView.bounds).CGPath
    }
}
