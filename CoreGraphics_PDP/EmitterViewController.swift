//
//  EmitterViewController.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 16.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class EmitterViewController: UIViewController {

    var skyLayer: CALayer?
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        super.didRotateFromInterfaceOrientation(fromInterfaceOrientation)
        skyLayer?.frame = self.view.bounds
    }
    
    func addConfetti() {
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.frame = self.view.bounds
        emitterLayer.renderMode = kCAEmitterLayerBackToFront
        emitterLayer.emitterShape = kCAEmitterLayerLine
        emitterLayer.emitterMode = kCAEmitterLayerOutline
        emitterLayer.emitterSize = CGSizeMake(self.view.frame.size.width, 1)
        emitterLayer.emitterPosition = CGPointMake(emitterLayer.frame.size.width/2, 0)
        emitterLayer.contentsScale = UIScreen.mainScreen().scale
        
        let centerCell = CAEmitterCell()
        centerCell.birthRate = 4
        centerCell.contents = UIImage(named: "Blue_confetti.png")?.CGImage
        centerCell.lifetime = 15.0
        centerCell.alphaSpeed = -0.01
        centerCell.velocity = 50
        centerCell.emissionLatitude = CGFloat(M_PI)
        centerCell.emissionLongitude = 0
        centerCell.spin = CGFloat(M_PI_2)
        centerCell.name = "Blue_confetti"
        
        let leftCell = CAEmitterCell()
        leftCell.birthRate = 4
        leftCell.contents = UIImage(named: "Red_confetti.png")?.CGImage
        leftCell.lifetime = 15.0
        leftCell.alphaSpeed = -0.01
        leftCell.velocity = 50
        leftCell.spin = CGFloat(M_PI_2)
        leftCell.emissionLatitude = CGFloat(M_PI)
        leftCell.emissionLongitude = 0
        
        let rightCell = CAEmitterCell()
        rightCell.birthRate = 4
        rightCell.contents = UIImage(named: "Green_confetti.png")?.CGImage
        rightCell.lifetime = 15.0
        rightCell.alphaSpeed = -0.01
        rightCell.velocity = 50
        rightCell.spin = CGFloat(M_PI_2)
        rightCell.emissionLatitude = CGFloat(M_PI)
        rightCell.emissionLongitude = 0
        
        emitterLayer.emitterCells = [centerCell, leftCell, rightCell]
        
        self.view.layer.addSublayer(emitterLayer)
        
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
    
    func addStarSky() {
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.frame = self.view.bounds
        emitterLayer.backgroundColor = UIColor.clearColor().CGColor
        emitterLayer.renderMode = kCAEmitterLayerAdditive
        emitterLayer.emitterShape = kCAEmitterLayerPoint
        emitterLayer.emitterMode = kCAEmitterLayerOutline
        emitterLayer.emitterPosition = CGPointMake(emitterLayer.frame.size.width/2 - 70, 10)
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
