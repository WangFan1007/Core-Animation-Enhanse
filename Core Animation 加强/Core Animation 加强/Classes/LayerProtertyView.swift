//
//  LayerProtertyView.swift
//  Core Animation 加强
//
//  Created by FFine on 2018/11/28.
//  Copyright © 2018 FFine. All rights reserved.
//

import UIKit

class LayerProtertyView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.borderColor = UIColor.blue.cgColor
        layer.borderWidth = 2
        
        layer.shadowOpacity = 0.9
        layer.shadowColor = UIColor.green.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 4)
    }

}
