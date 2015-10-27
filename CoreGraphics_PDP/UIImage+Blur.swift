//
//  UIImage+Blur.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 18.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

typealias FSImage = CIImage

extension UIImage {
    
    class func createBlurredWithBackground(image: UIImage, size: CGSize) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.mainScreen().scale)
        
        let filter = CIFilter(name: "CIGaussianBlur")
        filter?.setValue(NSNumber(float: 5.0), forKey: "inputRadius")
        filter?.setValue(FSImage(CGImage: image.CGImage!), forKey: "inputImage")
        
        if let lBlurredImage = filter?.outputImage {
            
            let fillSize = image.size.aspectFillToSize(size)
            var blurredImage = self.resizeImage(UIImage(CIImage: lBlurredImage), newSize: fillSize)!
            
            let ciContext = CIContext(options: nil)
            let croppedCGImage = ciContext.createCGImage(lBlurredImage, fromRect: FSImage(CGImage: image.CGImage!).extent)
            blurredImage = UIImage(CGImage: croppedCGImage)
            
            blurredImage.drawInRect(CGRectMake((size.width-fillSize.width)/2, (size.height-fillSize.height)/2, fillSize.width, fillSize.height))
        }
        
        let aspectSize = image.size.aspectFitToSize(size)
        image.drawInRect(CGRectMake((size.width-aspectSize.width)/2, (size.height-aspectSize.height)/2, aspectSize.width, aspectSize.height))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return image
    }

    class func resizeImage(image: UIImage, newSize: CGSize) -> UIImage? {
        
        UIGraphicsBeginImageContext(newSize)
        image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

extension CGSize {
    
    func aspectFitToSize(size: CGSize) -> CGSize {
        
        if (self.width >= size.width && self.height >= size.height) || (self.width <= size.width && self.height <= size.height) {
            
            if self.width/size.width > self.height/size.height {
                return CGSizeMake(size.width, size.width*(self.height/self.width))
            } else {
                return CGSizeMake(size.height*(self.width/self.height), size.height)
            }
        }
        
        var aspectFitSize: CGSize = self
        
        if  aspectFitSize.width >= size.width {
            aspectFitSize = CGSizeMake(size.width, size.width*(aspectFitSize.height/aspectFitSize.width))
        }
        
        if  aspectFitSize.height >= size.height {
            aspectFitSize = CGSizeMake(size.height*(aspectFitSize.width/aspectFitSize.height), size.height)
        }
        return aspectFitSize
    }
    
    func aspectFillToSize(size: CGSize) -> CGSize {
        
        if (self.width >= size.width && self.height >= size.height) || (self.width <= size.width && self.height <= size.height) {
            
            if self.width/size.width > self.height/size.height {
                return CGSizeMake(size.height*(self.width/self.height), size.height)
            } else {
                return CGSizeMake(size.width, size.width*(self.height/self.width))
            }
        }
        
        if size.width/self.width >= size.height/self.height {
            return CGSizeMake(size.width, size.width*(self.height/self.width))
        } else {
            return CGSizeMake(size.height*(self.width/self.height), size.height)
        }
    }
    
}
