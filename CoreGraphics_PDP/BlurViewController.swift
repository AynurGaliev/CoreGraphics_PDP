//
//  BlurViewController.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 18.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class BlurViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.imageView.image = UIImage.createBlurredWithBackground(UIImage(named: "Nature-1.jpg")!, size: self.imageView.frame.size)
        
    }

}
