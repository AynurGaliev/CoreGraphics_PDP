//
//  DrawView.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 02.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class CamomileView: UIView {
    
    @IBInspectable var radius: CGFloat = 0.0
    @IBInspectable var petalsCount: Int = 0
    @IBInspectable var petalColor: UIColor = UIColor.whiteColor()
    @IBInspectable var centerColor: UIColor = UIColor.yellowColor()
    @IBInspectable var petalsHeight: CGFloat = 0.0
    
    private var petals: [UIBezierPath]! = []
    var angle: CGFloat = 0.0
    var length: CGFloat = 0.0
    
    override class func layerClass() -> AnyClass {
        return CAShapeLayer.self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.setNeedsDisplay()
    }
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        
        for (var i=0; i<self.petals.count; i++) {
            if (CGPathContainsPoint(self.petals[i].CGPath, nil, point, false)) {
                print("Clicked \(i)")
            }
        }
        return super.hitTest(point, withEvent: event)
    }
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        let angleSector = CGFloat(360/self.petalsCount)
        
        let dx = self.radius*cos(CGFloat(angleSector/2.0).toRadians())
        let dy = self.radius*sin(CGFloat(angleSector/2.0).toRadians())
        
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextSetLineWidth(context, 2.0)
        
        CGContextBeginPath(context)
        CGContextAddArc(context, self.bounds.size.width/2,
            self.bounds.size.height/2, self.radius, CGFloat(-angleSector-90).toRadians(), CGFloat(angleSector-90).toRadians(), 0)
        CGContextMoveToPoint(context, self.bounds.size.width/2 - dx , self.bounds.size.height/2 - dy)
        CGContextAddCurveToPoint(context, self.bounds.size.width/2 - 3*dx, 0, self.bounds.size.width/2 + 3*dx, 0, self.bounds.size.width/2 + dx, self.bounds.size.height/2 - dy)
        
        let path = CGContextCopyPath(context)
        
        let petalPath = UIBezierPath(CGPath: path!)
        
        let totalPath: UIBezierPath = UIBezierPath()
        
        for (var i=0; i < self.petalsCount; i++) {
            
            let bezierPath = UIBezierPath(CGPath: petalPath.CGPath)
            var transform = CGAffineTransformMakeTranslation(0, -self.radius)
            transform = CGAffineTransformRotate(transform, CGFloat(i*5).toRadians())
//            transform = CGAffineTransformTranslate(transform, self.radius*cos(angleSector.toRadians()), self.radius*sin(angleSector.toRadians()))
            
            bezierPath.applyTransform(transform)
            self.petals.append(bezierPath)
            totalPath.appendPath(bezierPath)
        }
        
        CGContextAddPath(context, totalPath.CGPath)
        CGContextDrawPath(context, CGPathDrawingMode.Stroke)
        
        
        
//        let context = UIGraphicsGetCurrentContext()
//        let startPointX = self.bounds.size.width/2 - sin(CGFloat(180.0/CGFloat(self.petalsCount)).toRadians())*self.radius
//        let startPointY = self.bounds.size.height/2 - cos(CGFloat(180.0/CGFloat(self.petalsCount)).toRadians())*self.radius
//        let dx = sin(CGFloat(180.0/CGFloat(self.petalsCount)).toRadians())*self.radius
//        let dy = cos(CGFloat(180.0/CGFloat(self.petalsCount)).toRadians())*self.radius
//        
//        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
//        CGContextSetLineWidth(context, 2.0)
//        
//        for (var i:Int=0; i<self.petalsCount; i++) {
//            
//            CGContextSaveGState(context)
//            
//            CGContextTranslateCTM(context, self.bounds.size.width/2, self.bounds.size.height/2)
//            let rotationAngle = (360.0/CGFloat(self.petalsCount))*CGFloat(i)
//            let hitPoint: CGPoint
//            if self.alpha >= CGFloat(M_PI_2) {
//                hitPoint = CGPointMake(self.bounds.size.width/2 - self.length*sin(self.angle-rotationAngle.toRadians()),
//                    self.bounds.size.height/2 + self.length*cos(self.angle-rotationAngle.toRadians()))
//            } else {
//                hitPoint = CGPointMake(self.length*sin(self.angle-rotationAngle.toRadians()) + self.bounds.size.width/2,
//                    self.bounds.size.height/2 - self.length*cos(self.angle-rotationAngle.toRadians()))
//            }
//            
//            CGContextRotateCTM(context, CGFloat(rotationAngle.toRadians()))
//            CGContextTranslateCTM(context, -self.bounds.size.width/2, -self.bounds.size.height/2)
//            
//            CGContextBeginPath(context)
//            
//            CGContextMoveToPoint(context, startPointX, startPointY)
//            
//            CGContextAddCurveToPoint(context,
//                startPointX - 30,
//                startPointY - self.petalsHeight,
//                startPointX + 30 + 2*dx,
//                startPointY - self.petalsHeight,
//                startPointX + 2*dx,
//                startPointY)
//
//            CGContextClosePath(context)
//            let path = CGContextCopyPath(context)
//            if CGPathContainsPoint(path, nil, hitPoint, true) {
//                CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
//            } else {
//                CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
//            }
//            CGContextDrawPath(context, CGPathDrawingMode.FillStroke)
//            CGContextRestoreGState(context)
//        }
//        
//        CGContextSaveGState(context)
//        CGContextAddEllipseInRect(context, CGRectMake(self.bounds.size.width/2 - self.radius - 2,
//            self.bounds.size.height/2 - self.radius-2,
//            2*self.radius+4,
//            2*self.radius+4))
//        
//        let path = CGContextCopyPath(context)
//        
//        CGContextClip(context)
// 
//        let hitPoint: CGPoint
//        if self.alpha >= CGFloat(M_PI_2) {
//            hitPoint = CGPointMake(self.bounds.size.width/2 - self.length*sin(self.angle),
//                self.bounds.size.height/2 + self.length*cos(self.angle))
//        } else {
//            hitPoint = CGPointMake(self.length*sin(self.angle) + self.bounds.size.width/2,
//                self.bounds.size.height/2 - self.length*cos(self.angle))
//        }
//        
//        if CGPathContainsPoint(path, nil, hitPoint, true) {
//            let colorSpace = CGColorSpaceCreateDeviceRGB()
//            let gradient = CGGradientCreateWithColors(colorSpace, [UIColor.yellowColor().CGColor, UIColor.orangeColor().CGColor,UIColor.yellowColor().CGColor] as CFArray, [0.0, 0.5, 1.0])
//            CGContextDrawRadialGradient(context, gradient, CGPointMake(self.bounds.width/2, self.bounds.height/2), 0, CGPointMake(self.bounds.width/2, self.bounds.height/2), self.radius, CGGradientDrawingOptions.DrawsAfterEndLocation)
//        } else {
//            CGContextSetFillColorWithColor(context, self.centerColor.CGColor)
//            CGContextFillEllipseInRect(context, self.bounds)
//        }
//        CGContextRestoreGState(context)
    }
}

extension CGFloat {
    
    func toRadians() -> CGFloat {
        return (CGFloat(M_PI)/180.0)*self
    }
    
    func toDegrees() -> CGFloat {
        return (180.0/CGFloat(M_PI))*self
    }
}

extension Double {
    
    func toRadians() -> Double {
        return (M_PI/180.0)*self
    }
    
    func toDegrees() -> Double {
        return (180.0/M_PI)*self
    }
}