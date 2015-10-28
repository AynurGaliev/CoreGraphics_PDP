//
//  FireViewController.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 28.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class FireViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addFire()
    }
    
    func addFire() {
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.frame = self.view.bounds
        emitterLayer.renderMode = kCAEmitterLayerAdditive
        emitterLayer.emitterShape = kCAEmitterLayerPoint
        emitterLayer.emitterMode = kCAEmitterLayerOutline
        emitterLayer.emitterPosition = CGPointMake(emitterLayer.frame.size.width/2, emitterLayer.frame.size.height/2)
        emitterLayer.contentsScale = UIScreen.mainScreen().scale
        
        let centerCell = CAEmitterCell()
        centerCell.birthRate = 250
        centerCell.contents = UIImage(named: "Spark.png")?.CGImage
        centerCell.lifetime = 200.0
        centerCell.alphaSpeed = -0.2
        centerCell.velocity = 20
        centerCell.emissionRange = CGFloat(M_PI)*2.0
        centerCell.spin = CGFloat(M_PI)
        centerCell.spinRange = CGFloat(M_PI_2)
        
        emitterLayer.emitterCells = [centerCell]
        
        self.view.layer.addSublayer(emitterLayer)
        
    }
}
