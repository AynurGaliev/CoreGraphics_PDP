//
//  TextView.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 18.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit


class TextView: UIView {

    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextAddPath(context, UIBezierPath(roundedRect: self.bounds, cornerRadius: 5.0).CGPath)
        
        Save(context) { () -> Void in
           
            CGContextAddPath(context, UIBezierPath(roundedRect: self.bounds, cornerRadius: 10.0).CGPath)
            CGContextClip(context)
            let gradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [UIColor.whiteColor().CGColor, UIColor.redColor().CGColor] as CFArray, [0.0, 1.0])
            CGContextDrawRadialGradient(context, gradient, self.center, 5, self.center, self.bounds.width, CGGradientDrawingOptions.DrawsBeforeStartLocation)
        }
        
        Save(context) { () -> Void in
            
            Save(context, saveBlock: { () -> Void in
                
                let textPath = NSString(string: "Text").bezierPath(UIFont(name: "Helvetica-Light", size: 100.0)!)
                let boundingBox = CGPathGetBoundingBox(textPath.CGPath)
                CGContextTranslateCTM(context, (self.bounds.size.width - boundingBox.size.width)/2, ((self.bounds.size.height - boundingBox.size.height)/2))
                CGContextAddPath(context, textPath.CGPath)
            })

            CGContextAddPath(context, UIBezierPath(roundedRect: CGRectInset(self.bounds, 8, 8), cornerRadius: 10).CGPath)
            
            CGContextEOClip(context)
            
            CGContextSetFillColorWithColor(context, UIColor.blueColor().CGColor)
            CGContextFillRect(context, self.bounds)
        }
        
    }

}

class ShapeTextView: UIView {
    
    override class func layerClass() -> AnyClass {
        return CAShapeLayer.self
    }
}

func Save(context: CGContextRef?, saveBlock: (()->Void) ) {
    
    CGContextSaveGState(context)
    saveBlock()
    CGContextRestoreGState(context)
}

extension NSString {
    
    func bezierPath(font: UIFont) -> UIBezierPath {
        
        let bezierPath = UIBezierPath()
        
        let fontRef = CTFontCreateWithName(font.fontName, font.pointSize, nil)
        
        let charsBuffer = UnsafeMutablePointer<unichar>(malloc(sizeof(UniChar)*self.length))
        let glyphsBuffer = UnsafeMutablePointer<CGGlyph>(malloc(sizeof(CGGlyph)*self.length))
        
        self.getCharacters(charsBuffer)
        
        if !CTFontGetGlyphsForCharacters(fontRef, charsBuffer, glyphsBuffer, self.length) {
            fatalError("Glyphs weren't got")
        }
        
        var offset: CGFloat = 0.0
        
        for var i=0; i<self.length; i++ {
            let path: CGPath = CTFontCreatePathForGlyph(fontRef, glyphsBuffer[self.length - i - 1], nil)!
            let bezierSubpath = UIBezierPath(CGPath: path)
            offset = (self.substringWithRange(NSMakeRange(self.length - i - 1, 1)) as NSString).sizeWithAttributes([NSFontAttributeName: font]).width
            bezierPath.applyTransform(CGAffineTransformMakeTranslation(offset, 0.0))
            bezierPath.appendPath(bezierSubpath)
        }
        
        //applying transform from CoreGraphics to UIKit coordinates
        let boundingBox = CGPathGetBoundingBox(bezierPath.CGPath)
        var transform = CGAffineTransformMakeScale(1, -1)
        transform = CGAffineTransformTranslate(transform, boundingBox.origin.x, -(boundingBox.origin.y + boundingBox.size.height))
        bezierPath.applyTransform(transform)
        
        return bezierPath
    }
}

extension UIBezierPath {
    
    func centralizeInRect(rect: CGRect) {
        
        let boundingBox = CGPathGetBoundingBox(self.CGPath)
        let transform = CGAffineTransformMakeTranslation((rect.width - boundingBox.width)/2 - rect.origin.x - boundingBox.origin.x, (rect.height - boundingBox.height)/2 - rect.origin.y - boundingBox.origin.y)
        self.applyTransform(transform)
    }
}