//
//  SunEmitterViewController.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 28.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class SunEmitterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSun()
    }
    
    func addSun() {
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.frame = self.view.bounds
        emitterLayer.renderMode = kCAEmitterLayerAdditive
        emitterLayer.emitterShape = kCAEmitterLayerPoint
        emitterLayer.emitterMode = kCAEmitterLayerOutline
        emitterLayer.emitterPosition = CGPointMake(emitterLayer.frame.size.width/2, emitterLayer.frame.size.height/2)
        emitterLayer.contentsScale = UIScreen.mainScreen().scale
        
        let centerCell = CAEmitterCell()
        centerCell.birthRate = 250
        centerCell.contents = UIImage(named: "Light.png")?.CGImage
        centerCell.lifetime = 200.0
        centerCell.alphaSpeed = -0.1
        centerCell.velocity = 20
        centerCell.emissionRange = CGFloat(M_PI)*2.0
        centerCell.greenSpeed = 1.5
        
        emitterLayer.emitterCells = [centerCell]
        
        let layer = CAShapeLayer()
        layer.fillColor = UIColor(red: 255/255, green: 255/255, blue: 3/255, alpha: 0.8).CGColor
        layer.backgroundColor = UIColor.clearColor().CGColor
        layer.path = UIBezierPath(ovalInRect: CGRectMake(emitterLayer.frame.size.width/2 - 75, emitterLayer.frame.size.height/2 - 75, 150, 150)).CGPath
        
        self.view.layer.addSublayer(emitterLayer)
        self.view.layer.addSublayer(layer)
        
    }
}
