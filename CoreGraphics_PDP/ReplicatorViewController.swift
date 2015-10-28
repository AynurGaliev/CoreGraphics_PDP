//
//  ReplicatorViewController.swift
//  CoreGraphics_PDP
//
//  Created by Galiev Aynur on 15.10.15.
//  Copyright © 2015 FlatStack. All rights reserved.
//

import UIKit

class ReplicatorViewController: UIViewController {

    @IBOutlet weak var replicatorButton: ReplicatorButton!
    var reflectedImageView: ReflectedImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reflectedImageView = ReflectedImageView.createView()
        self.reflectedImageView.frame = CGRectMake(20, 240, self.view.bounds.size.width - 40, 140)
        self.view.addSubview(self.reflectedImageView)
    }

}
