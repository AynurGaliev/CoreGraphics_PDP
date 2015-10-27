//
//  MaskView.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 18.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

extension UIImage {
    
    func createMaskedImage(maskImage: UIImage, maskRegion: CGRect) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.mainScreen().scale)
        let context = UIGraphicsGetCurrentContext()
        
        self.flipVertically(context, size: self.size)
        
        CGContextClipToMask(context, maskRegion, maskImage.CGImage)

        self.flipVertically(context, size: self.size)
        
        self.drawInRect(CGRectMake(0, 0, self.size.width, self.size.height))
        
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return resultImage
    }
    
    func createEOMaskedImage(maskImage: UIImage, maskRegion: CGRect) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let context = UIGraphicsGetCurrentContext()
        
        let mask = CGImageMaskCreate(CGImageGetWidth(maskImage.CGImage),
                                     CGImageGetHeight(maskImage.CGImage),
                                     CGImageGetBitsPerComponent(maskImage.CGImage),
                                     CGImageGetBitsPerPixel(maskImage.CGImage),
                                     CGImageGetBytesPerRow(maskImage.CGImage),
                                     CGImageGetDataProvider(maskImage.CGImage),
                                     nil,
                                     false)
        
        self.flipVertically(context, size: self.size)
        
        CGContextClipToMask(context, maskRegion, mask)
        
        self.flipVertically(context, size: self.size)
        
        self.drawInRect(CGRectMake(0, 0, self.size.width, self.size.height))
        
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resultImage
    }
    
    func createWithMaskingColors(maskImage: UIImage) -> UIImage? {
        
        let pointer = UnsafeMutablePointer<CGFloat>(malloc(sizeof(CGFloat)*6))
        
        pointer[0] = 255
        pointer[1] = 255
        pointer[2] = 255
        pointer[3] = 255
        pointer[4] = 255
        pointer[5] = 255
        
        let maskedImage = CGImageCreateWithMaskingColors(maskImage.CGImage, pointer)

        if let lMaskedImage = maskedImage {
            let image = UIImage(CGImage: lMaskedImage, scale: maskImage.scale, orientation: self.imageOrientation)
            let resultImage = self.createMaskedImage(image, maskRegion: CGRectMake(0, 0, self.size.width, self.size.height))
            return resultImage
        } else {
            return nil
        }
    }

    
    private func flipVertically(context: CGContextRef?, size: CGSize) {
        CGContextTranslateCTM(context, 0, size.height)
        CGContextScaleCTM(context, 1, -1)
    }
}

extension UIImage {
    
    func debugQuickLookObject() -> AnyObject? {
        
        _ = UIGraphicsBeginImageContextWithOptions(self.size, false, 2)
        self.drawInRect(CGRectMake(0, 0, self.size.width, self.size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension CGImage {
    
    func debugQuickLookObject() -> AnyObject? {
        
        let image = UIImage(CGImage: self)
        _ = UIGraphicsBeginImageContextWithOptions(image.size, false, 2)
        image.drawInRect(CGRectMake(0, 0, image.size.width, image.size.height))
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resultImage
    }
}