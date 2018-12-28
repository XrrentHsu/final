//
//  ViewController.swift
//  final
//
//  Created by User01 on 2018/12/26.
//  Copyright © 2018 chen. All rights reserved.
//

import UIKit
import GoogleMaps
class ViewController: UIViewController,GMSMapViewDelegate{
    var latitude:String = ""
    var longitude:String = ""
    var mapName:String = ""
    var mapPosition:String = ""
    
    @IBOutlet weak var mapView: GMSMapView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let parameterLatitude=Double(latitude)
        let parameterLongitude=Double(longitude)
        let camera=GMSCameraPosition.camera(withLatitude: parameterLatitude!, longitude:parameterLongitude!, zoom: 16.0)
        mapView.camera=camera
        let marker=GMSMarker()
        marker.position=CLLocationCoordinate2D(latitude: parameterLatitude!, longitude:parameterLongitude!)
        marker.map=mapView
        marker.title=mapName
        marker.snippet=mapPosition
        
        mapView.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
    }
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        performSegue(withIdentifier: "showPano", sender: nil )
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let controller = segue.destination as! panoViewController
            controller.panoLatitude=latitude
            controller.panoLongitude=longitude
    }

}

