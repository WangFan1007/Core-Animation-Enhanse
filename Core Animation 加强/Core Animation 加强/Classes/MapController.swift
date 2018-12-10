//
//  MapController.swift
//  Core Animation 加强
//
//  Created by FFine on 2018/12/10.
//  Copyright © 2018 FFine. All rights reserved.
//

import UIKit
import MapKit

class MapController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
}

extension MapController{
    @IBAction func queryDistances(_ sender: Any) {
        
//        30.5036340000,104.0414010000  南湖半岛
        let startplacemark = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 30.5036340000,longitude: 104.0414010000))
        //30.6347350000,104.1244850000 塔子山公园
        let stop = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 30.6347350000,longitude: 104.1244850000))
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startplacemark)
        request.destination = MKMapItem(placemark: stop)
        request.transportType = .automobile
        let directions = MKDirections(request: request)
        
//        directions.calculate { ( resp:MKDirections.Response?, err: Error?) in
//            print(err ?? "成功拉1")
//            print(resp ?? "没有结果1")
//            for route in resp?.routes ?? []{
//                print(route.distance)
//            }
//        }
        
        directions.calculateETA { (resp:MKDirections.ETAResponse?, err : Error?) in
            print(err ?? "成功拉2")
            print(resp?.distance ?? "没有结果2")
        }
        
    }
 
}
