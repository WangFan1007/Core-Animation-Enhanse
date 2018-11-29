//
//  LayersMasksView.swift
//  Core Animation 加强
//
//  Created by FFine on 2018/11/28.
//  Copyright © 2018 FFine. All rights reserved.
//

import UIKit

class LayersMasksView: UIImageView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let maskLayer = CALayer()
        maskLayer.frame = bounds
        maskLayer.contents = UIImage(named: "triangle")?.cgImage
        
        layer.mask = maskLayer
    }

}
