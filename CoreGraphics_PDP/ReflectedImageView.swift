//
//  ReflectedImageView.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 15.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class ReflectedImageView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    
    override class func layerClass() -> AnyClass {
        return CAReplicatorLayer.self
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let layer = self.layer as! CAReplicatorLayer
        layer.instanceCount = 2
        
        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, 0, self.bounds.size.height - 10, 0)
        transform = CATransform3DScale(transform, 1, -1 , 0)
        layer.instanceTransform = transform
        
        layer.instanceAlphaOffset = -0.6
    }
    
    class func createView() -> ReflectedImageView {
        return NSBundle.mainBundle().loadNibNamed("ReflectedImageView", owner: nil, options: nil).first as! ReflectedImageView
    }
}
