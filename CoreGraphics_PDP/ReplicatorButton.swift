//
//  BuyButton.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 15.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class ReplicatorButton: UIButton {

    override class func layerClass() -> AnyClass {
        return CALayer.self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let replicator = CAReplicatorLayer()
        replicator.frame = self.bounds
        replicator.backgroundColor = UIColor.orangeColor().CGColor
        replicator.cornerRadius = 6
        replicator.instanceCount = 30
        replicator.instanceDelay = CFTimeInterval(1.0/30.0)
        replicator.instanceColor = UIColor.whiteColor().CGColor
        
        let transform = CATransform3DMakeRotation(CGFloat(M_PI*2)/CGFloat(replicator.instanceCount), 0, 0, 1)
        
        replicator.instanceTransform   = transform
        replicator.instanceAlphaOffset = 0
        replicator.instanceBlueOffset  = -0.1
        replicator.instanceGreenOffset = -0.1
        replicator.instanceRedOffset   = -0.1
        
        let layer = CALayer()
        layer.backgroundColor = UIColor.whiteColor().CGColor
        layer.frame = CGRectMake(replicator.bounds.size.width/2 - 5, 0, 10, 30)
        layer.opacity = 0.0
        
        let animation = CABasicAnimation()
        animation.keyPath = "opacity"
        animation.fromValue = NSNumber(double: 1.0)
        animation.toValue = NSNumber(double: 0.0)
        animation.repeatDuration = Double.infinity
        animation.duration = 1.0
        
        layer.addAnimation(animation, forKey: "opacity")
        
        replicator.addSublayer(layer)
        
        self.layer.addSublayer(replicator)
        
    }

}
