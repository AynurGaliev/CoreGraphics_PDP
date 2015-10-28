//
//  SkyViewController.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 28.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class SkyViewController: UIViewController {

    var skyLayer: CALayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addStarSky()
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        super.didRotateFromInterfaceOrientation(fromInterfaceOrientation)
        self.skyLayer?.frame = self.view.bounds
    }
    
    func addStarSky() {
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.frame = self.view.bounds
        emitterLayer.backgroundColor = UIColor.clearColor().CGColor
        emitterLayer.renderMode = kCAEmitterLayerAdditive
        emitterLayer.emitterShape = kCAEmitterLayerPoint
        emitterLayer.emitterMode = kCAEmitterLayerOutline
        emitterLayer.emitterPosition = CGPointMake(emitterLayer.frame.size.width/2 - 20, 40)
        emitterLayer.contentsScale = UIScreen.mainScreen().scale
        
        let centerCell = CAEmitterCell()
        centerCell.birthRate = 3
        centerCell.contents = UIImage(named: "Star.png")?.CGImage
        centerCell.lifetime = 200.0
        centerCell.velocity = 20
        centerCell.emissionLongitude = 0.0
        centerCell.emissionRange = CGFloat(0.5)
        centerCell.yAcceleration = 5
        centerCell.xAcceleration = 20
        centerCell.scale = 0.1
        centerCell.scaleSpeed = 0.02
        
        emitterLayer.emitterCells = [centerCell]
        
        self.skyLayer = CALayer()
        self.skyLayer?.contents = UIImage(named: "sky.png")?.CGImage
        self.skyLayer?.frame = emitterLayer.frame
        
        if let layer = self.skyLayer {
            self.view.layer.addSublayer(layer)
        }
        self.view.layer.addSublayer(emitterLayer)
        
    }

}
