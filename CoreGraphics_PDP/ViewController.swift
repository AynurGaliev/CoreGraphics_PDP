//
//  ViewController.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 02.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var prettyLabel: PrettyLabel!
    @IBOutlet weak var camomileView: CamomileView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let layer = self.animatableLayer()
        layer.frame = CGRectMake((self.view.frame.size.width-layer.frame.size.width)/2, (self.view.frame.size.height-layer.frame.size.height)/2, layer.frame.size.width, layer.frame.size.height)
        self.view.layer.addSublayer(layer)
    }
    
    func animatableLayer() -> CAShapeLayer {
        
        let layer: CAShapeLayer = CAShapeLayer()
        let path = BezierPathFromString("Text", UIFont(name: "Baskerville-Bold", size: 100.0))
        path.applyTransform(CGAffineTransformMakeTranslation(10, 10))
        layer.frame = CGRectInset(PathBoundingBox(path), -10, -10)
        layer.path = path.CGPath
        layer.backgroundColor = UIColor.whiteColor().CGColor
        layer.cornerRadius = 5.0
        
        layer.strokeColor = UIColor.blackColor().CGColor
        layer.lineWidth = 3
        layer.fillColor = UIColor.redColor().CGColor
        layer.strokeStart = 0.0
        layer.strokeEnd = 1.0
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.delegate = self
        animation.duration = 15.0
        animation.fromValue = NSNumber(float: 0.0)
        animation.toValue = NSNumber(float: 1.0)
        animation.removedOnCompletion = true
        animation.fillMode = kCAFillModeBoth
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        layer.addAnimation(animation, forKey: "strokeEndAnimation")
        return layer
    }

    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        
        if let lSublayers = self.view.layer.sublayers {
            for layer in lSublayers {
                if layer.isKindOfClass(CAShapeLayer.self) {
                    layer.removeFromSuperlayer()
                }
            }
        }
    }
}
