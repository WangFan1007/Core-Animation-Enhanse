//
//  ViewController.swift
//  Core Animation 加强
//
//  Created by FFine on 2018/11/27.
//  Copyright © 2018 FFine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var layerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addImgTolayerView()
    }
}


extension ViewController{
    
    func addImgTolayerView() {
        let img = UIImage(named: "liucheng")
        layerView.layer.contents = img?.cgImage
        layerView.layer.contentsGravity = CALayerContentsGravity.center
//        layerView.layer.contentsScale = img?.scale ?? 1
        layerView.layer.contentsScale = UIScreen.main.scale
//        layerView.clipsToBounds = true
        layerView.layer.masksToBounds = true

    }
    
}



