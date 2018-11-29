//
//  GroupAnimViewController.swift
//  Core Animation 加强
//
//  Created by FFine on 2018/11/29.
//  Copyright © 2018 FFine. All rights reserved.
//

import UIKit

class GroupAnimViewController: UIViewController {

    var path : UIBezierPath? = nil
    var colorLayer : CALayer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addlayers()
        
        addanimations()
    }
}

//MARK 初始化图层
extension GroupAnimViewController{
    func addlayers() {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 100, y: 150))
        bezierPath.addCurve(to: CGPoint(x:300,y:150), controlPoint1: CGPoint(x:200,y:200), controlPoint2: CGPoint(x:350,y:200))
        
        let shapeLine = CAShapeLayer()
        shapeLine.path = bezierPath.cgPath
        shapeLine.strokeColor = UIColor.red.cgColor
        shapeLine.fillColor = UIColor.clear.cgColor
        view.layer .addSublayer(shapeLine)
        
        let colorLayer = CALayer()
        colorLayer.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        colorLayer.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.9).cgColor
        colorLayer.position = CGPoint(x: 300, y: 150)
        view.layer.addSublayer(colorLayer)
        
        self.colorLayer = colorLayer
        self.path = bezierPath
    }
}
//MARK 添加动画
extension GroupAnimViewController{
    
    func addanimations() {
        let rotateAnim = CABasicAnimation()
        rotateAnim.keyPath = "transform.rotation"
//        rotateAnim.duration = 2
//        rotateAnim.repeatCount = Float(Int.max)
        rotateAnim.byValue = Double.pi*4
//        rotateAnim.autoreverses = true
//        colorLayer?.add(rotateAnim, forKey: nil)
        
        let pathAnim = CAKeyframeAnimation()
        pathAnim.path = path?.cgPath
        pathAnim.keyPath = "position"
//        pathAnim.duration = 2
//        pathAnim.repeatCount = Float(Int.max)
//        pathAnim.autoreverses = true
//        colorLayer?.add(pathAnim, forKey: nil)
        
        let groupAnim = CAAnimationGroup()
        groupAnim.animations = [rotateAnim,pathAnim]
        groupAnim.duration = 2
        groupAnim.repeatCount = Float(Int.max)
        groupAnim.autoreverses = true
        
        colorLayer?.add(groupAnim, forKey: nil)
    }
    
}
