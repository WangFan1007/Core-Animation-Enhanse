//
//  ClockView.swift
//  Core Animation 加强
//
//  Created by FFine on 2018/11/28.
//  Copyright © 2018 FFine. All rights reserved.
//

import UIKit

class ClockView: UIView {
    
    lazy var hoursView : UIView = {
        return UIView()
    }()
    lazy var secondsView : UIView = {
        return UIView()
        }()
    lazy var minutsView : UIView = {
        return UIView()
    }()
    
    var timer : Timer? = nil
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupClock()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubViewsFrames()
        setupClock()
        

    }
    

    
}
//MARK:设置子view
extension ClockView{
    func setupClock() {
        hoursView.backgroundColor = UIColor.green
        addSubview(hoursView)
        minutsView.backgroundColor = UIColor.cyan
        addSubview(minutsView)
        secondsView.backgroundColor = UIColor.red
        addSubview(secondsView)
        let anchorP = CGPoint(x: 0.5, y: 0.8)
        
        hoursView.layer.anchorPoint = anchorP
        minutsView.layer.anchorPoint = anchorP
        secondsView.layer.anchorPoint = anchorP
        
//        guard let timer : Timer? = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true) else{
//            return
//        }
        guard let timer : Timer? = Timer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true) else{
            return
        }
        
//        timer?.fire()
        RunLoop.main.add(timer!, forMode: RunLoop.Mode.common)
    }
    
    func setupSubViewsFrames() {
        let radius = min(bounds.width,bounds.height) / 2 - 2
        let originP = CGPoint(x: frame.width/2, y: frame.height/2)
        hoursView.frame = CGRect(origin: originP, size: CGSize(width: radius * 0.1, height: radius * 0.5))
        minutsView.frame = CGRect(origin: originP, size: CGSize(width: radius * 0.07, height: radius * 0.7))
        secondsView.frame = CGRect(origin: originP, size: CGSize(width: radius * 0.05, height: radius * 0.9))
        hoursView.center = originP
        minutsView.center = originP
        secondsView.center = originP
        
        tick()
    }
}
//MARK:画背景
extension ClockView{
    override func draw(_ rect: CGRect) {
        let radius = min(bounds.width,bounds.height) / 2 - 2
        let circle = UIBezierPath(arcCenter: CGPoint(x: bounds.width/2, y: bounds.height/2), radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        UIColor.blue.setStroke()
        circle.lineWidth = 2
        circle.stroke()
    }
}

//MARK:start a timer
extension ClockView{
    @objc func tick() {
        let calendar = NSCalendar(calendarIdentifier: .chinese)
        let now = Date()
        guard let hours = calendar?.component(.hour, from: now) else{
            return
        }
        let minuts = calendar?.component(.minute, from: now)
        let seconds = calendar?.component(.second, from: now)
        
//        Double.pi * 2 * hours
        hoursView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 2 / 12 * Double(hours)))
        minutsView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 2 / 60 * Double(minuts ?? 0)))
        secondsView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 2 / 60 * Double(seconds ?? 0)))
        print("ticked")
    }
}
