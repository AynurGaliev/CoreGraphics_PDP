//
//  FontUtility.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 04.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class FontUtility: NSObject {

    class func path(text: NSString, size: CGSize) -> UIBezierPath {
    
        var path = UIBezierPath()
        let fontRef = CTFontCreateWithName("Baskerville-Bold", 20.0, nil)
        let glyphs = UnsafeMutablePointer<CGGlyph>(malloc(sizeof(CGGlyph)*text.length))
        
        let chars = UnsafeMutablePointer<UniChar>(malloc(sizeof(UniChar)*text.length))
        
        text.getCharacters(chars)
        
        CTFontGetGlyphsForCharacters(fontRef, chars, glyphs, text.length)
    
        for var i = 0; i < text.length; i++ {
            
            let pathRef = CTFontCreatePathForGlyph(fontRef, glyphs[i], nil);
            print(UIBezierPath(CGPath: pathRef!))
            path.appendPath(UIBezierPath(CGPath: pathRef!))
            
            let str =  text.substringWithRange(NSMakeRange(i, 1))
            
            let size = (str as NSString).boundingRectWithSize(CGSizeMake(CGFloat.max, CGFloat.max),
                options: NSStringDrawingOptions.UsesLineFragmentOrigin,
                attributes: [NSFontAttributeName: UIFont(name: "Baskerville-Bold", size: 20.0)!],
                context: nil)
            offsetPath(path, offset: CGSizeMake(size.width, 0))
        }
        
        
        return mirrorVertically(path, size: size)
    }

    class func mirrorHorizontally(path: UIBezierPath, size: CGSize) -> UIBezierPath {
            
        let tr = CGAffineTransformMakeScale(-1, 1)
        let rect = CGPathGetPathBoundingBox(path.CGPath)
        let center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
            
        var t = CGAffineTransformIdentity
        t = CGAffineTransformTranslate(t, center.x, center.y);
        t = CGAffineTransformConcat(tr, t);
        t = CGAffineTransformTranslate(t, -center.x, -center.y);
            
        path.applyTransform(t)
        return path
    }
    
    class func mirrorVertically(path: UIBezierPath, size: CGSize) -> UIBezierPath {

        let tr = CGAffineTransformMakeScale(1, -1)
        applyCenterPathTransform(path, transform: tr)
        return path
    }

    class func offsetPath(path: UIBezierPath, offset: CGSize) {
        let t: CGAffineTransform = CGAffineTransformMakeTranslation(offset.width, offset.height)
        applyCenterPathTransform(path, transform: t)
    }
    
    class func applyCenterPathTransform(path: UIBezierPath, transform: CGAffineTransform) {
        let center = pathBoundingCenter(path)
        var t = CGAffineTransformIdentity
        t = CGAffineTransformTranslate(t, center.x, center.y)
        t = CGAffineTransformConcat(transform, t)
        t = CGAffineTransformTranslate(t, -center.x, -center.y)
        path.applyTransform(t)
    }

    class func pathBoundingCenter(path: UIBezierPath) -> CGPoint {
        let rect = CGPathGetPathBoundingBox(path.CGPath)
        return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
    }
}
