//
//  GradientButton.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 15.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class GradientButton: UIButton {

    private var darkLayer: RadialGradientLayer!
    private var shadowLayer: ShadowLayer!
    private var blueLayer: RadialGradientLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initailize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initailize()
    }
    
    private func initailize() {
        
        self.layer.masksToBounds = false
        self.layer.contentsScale = UIScreen.mainScreen().scale
            
        self.darkLayer = RadialGradientLayer(defaultColors: [UIColor.lightGrayColor().CGColor, UIColor.darkGrayColor().CGColor], highlightedColors: [], isDefault: true)
        self.darkLayer.frame = self.bounds
        self.darkLayer.shadowColor = UIColor.blackColor().CGColor
        self.darkLayer.shadowOffset = CGSizeMake(0, 0)
        self.darkLayer.shadowOpacity = 1
        self.darkLayer.shadowPath = UIBezierPath(ovalInRect: self.darkLayer.bounds).CGPath
        self.darkLayer.shadowRadius = 6
        self.darkLayer.allowsEdgeAntialiasing = true
        self.darkLayer.contentsScale = 3
        self.darkLayer.setNeedsDisplay()
        
        self.shadowLayer = ShadowLayer()
        self.shadowLayer.frame = CGRectInset(self.bounds, 30, 30)
        self.shadowLayer.contentsScale = 3
        self.shadowLayer.setNeedsDisplay()

        self.blueLayer = RadialGradientLayer(defaultColors: [UIColor(red: 158/255, green: 213/255, blue: 235/255, alpha: 1.0).CGColor, UIColor(red: 72/255, green: 121/255, blue: 134/255, alpha: 1.0).CGColor], highlightedColors: [UIColor(red: 158/255, green: 213/255, blue: 235/255, alpha: 1.0).CGColor, UIColor(red: 142/255, green: 243/255, blue: 187/255, alpha: 1.0).CGColor], isDefault: true)
        self.blueLayer.frame = CGRectInset(self.bounds, 30, 30)
        self.blueLayer.contentsScale = 3
        self.blueLayer.setNeedsDisplay()
        
        self.layer.addSublayer(self.darkLayer)
        self.layer.addSublayer(self.blueLayer)
        self.layer.addSublayer(self.shadowLayer)
    }
    
    override var highlighted: Bool {
        didSet {
            if self.highlighted {
                self.blueLayer.isDefault = false
            } else {
                self.blueLayer.isDefault = true
            }
        }
    }
}

//Radial Gradient Layer
private class RadialGradientLayer: CALayer {
    
    private var defaultColors: [CGColor] = []
    private var highlightedColors: [CGColor] = []
    
    override init() {
        super.init()
    }
    
    convenience init(defaultColors: [CGColor], highlightedColors: [CGColor], isDefault: Bool) {
        self.init()
        self.defaultColors = defaultColors
        self.highlightedColors = highlightedColors
        self.isDefault = isDefault
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isDefault: Bool = true {
        didSet {
            self.setNeedsDisplay()
        }
    }
    override func drawInContext(context: CGContext) {
        
        CGContextSetFillColorWithColor(context, UIColor.clearColor().CGColor)
        CGContextFillRect(context, self.bounds)
        
        CGContextAddPath(context, UIBezierPath(ovalInRect: self.bounds).CGPath)
        
        CGContextSaveGState(context)
        
        CGContextClip(context)
        
        let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), self.isDefault ? self.defaultColors : self.highlightedColors , [0.1, 1.0])
        CGContextDrawRadialGradient(context, gradient, CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2), 10, CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2), self.bounds.width/2, CGGradientDrawingOptions.DrawsBeforeStartLocation)
        
        CGContextRestoreGState(context)
    }
}

//Shadow layer
private class ShadowLayer: CALayer {
    
    private var circlePath: UIBezierPath!
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawInContext(context: CGContext) {
        
        CGContextSetShadowWithColor(context, CGSizeMake(0, 4), 4, UIColor.blackColor().CGColor)
        
        CGContextAddPath(context, UIBezierPath(ovalInRect: self.bounds).CGPath)
        
        CGContextSaveGState(context)
        
        CGContextClip(context)

        var path = UIBezierPath(ovalInRect: self.bounds)
        path = path.inverse(CGRectInfinite)
        CGContextAddPath(context, path.CGPath)
        
        CGContextEOFillPath(context)
        
        CGContextRestoreGState(context)
 
    }
}

extension UIBezierPath {
    
    func inverse(rect: CGRect) -> UIBezierPath {
        
        let path = UIBezierPath()
        path.appendPath(self)
        path.appendPath(UIBezierPath(rect: rect))
        path.usesEvenOddFillRule = true
        return path
    }
}