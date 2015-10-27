//
//  LayerViewController.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 17.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class LayerViewController: UIViewController {

    @IBOutlet weak var layerView: LayerView!
    @IBOutlet weak var standartView: UIView!

    @IBAction func changeColor(sender: UIButton) {
        
        let red: CGFloat = CGFloat(arc4random_uniform(255))/255.0
        let green: CGFloat = CGFloat(arc4random_uniform(255))/255.0
        let blue: CGFloat = CGFloat(arc4random_uniform(255))/255.0
        
        self.layerView.layer.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0).CGColor
        self.standartView.layer.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0).CGColor
    }
    
    @IBAction func move(sender: UIButton) {
        
        self.standartView.frame = CGRectOffset(self.standartView.frame, 100, 0)
        self.layerView.frame = CGRectOffset(self.layerView.frame, 100, 0)
    }

}
