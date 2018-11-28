//
//  PropertyAnimationViewController.swift
//  Core Animation 加强
//
//  Created by FFine on 2018/11/28.
//  Copyright © 2018 FFine. All rights reserved.
//

import UIKit

class PropertyAnimationViewController: UIViewController {

    @IBOutlet weak var layerView: UIView!
    
    lazy var animLayer = { () -> CALayer in
       let layer =  CALayer()
        layer.frame = layerView.bounds
        return layer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
   
    
}

//MARK setup
extension PropertyAnimationViewController{
    
    func setupView() {
        layerView.layer.addSublayer(animLayer)
    }
}

//MARK event
extension PropertyAnimationViewController{
    @IBAction func startAnimate() {
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(1)
        
        let randomColor = UIColor(red: CGFloat(arc4random_uniform(256)) / CGFloat(256), green: CGFloat(arc4random_uniform(256)) / CGFloat(256), blue: CGFloat(arc4random_uniform(256)) / CGFloat(256), alpha: 1)
        
        animLayer.backgroundColor = randomColor.cgColor
        
        CATransaction.commit()
    }
}
