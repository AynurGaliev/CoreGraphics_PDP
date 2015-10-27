//
//  ShapeButton.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 17.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class ShapeButton: UIButton {

    private var flag: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        (self.layer as! CAShapeLayer).fillColor = UIColor.redColor().CGColor
        (self.layer as! CAShapeLayer).path = UIBezierPath(rect: self.bounds).CGPath
    }
    
    override class func layerClass() -> AnyClass {
        return CAShapeLayer.self
    }
    
}
