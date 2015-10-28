//
//  EmitterViewController.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 16.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class ConfettiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addConfetti()
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
}
