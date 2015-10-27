//
//  LayerView.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 17.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class LayerView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func actionForLayer(layer: CALayer, forKey event: String) -> CAAction? {
        
        if event == "backgroundColor" {
            
            let transition = CATransition()
            transition.type = kCATransitionFade
            transition.subtype = kCATransitionFromTop
            transition.duration = 2
            
            return transition
        }
        
        if event == "position" {
            
            let transition = CATransition()
            transition.type = kCATransitionFade
            transition.subtype = kCATransitionFromLeft
            transition.duration = 4
            
            return transition
        }
        
        return super.actionForLayer(layer, forKey: event)
    }
    
}
