//
//  CropView.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 04.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class CropView: UIView {

    override func drawRect(rect: CGRect) {

        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, UIColor(patternImage: UIImage(named: "Nature-1.jpg")!).CGColor)
        CGContextFillRect(context, self.bounds)
        
        CGContextSaveGState(context)
        
        CGContextAddPath(context, UIBezierPath(ovalInRect: rect).CGPath)
        
        CGContextClip(context)

        CGContextSetFillColorWithColor(context, UIColor.purpleColor().CGColor)
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextSetLineWidth(context, 2.0)
        
        CGContextRestoreGState(context)
    }
}
