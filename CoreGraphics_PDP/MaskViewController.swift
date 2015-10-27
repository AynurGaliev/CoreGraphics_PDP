//
//  MaskViewController.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 18.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class MaskViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let image = UIImage(named:"Nature-1.jpg")!

        
        self.firstImageView.image = image.createMaskedImage(UIImage(named: "StarWithoutBackground.png")!, maskRegion: CGRectMake(0, 0, image.size.width, image.size.height))
        self.secondImageView.image = image.createEOMaskedImage(UIImage(named: "StarWithoutBackground.png")!, maskRegion: CGRectMake(0, 0, image.size.width, image.size.height))

    }
}
