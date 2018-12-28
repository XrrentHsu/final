//
//  panoViewController.swift
//  final
//
//  Created by User18 on 2018/12/27.
//  Copyright © 2018 chen. All rights reserved.
//

import UIKit
import GoogleMaps
class panoViewController: UIViewController {
    //latitude: 25.149970, longitude:121.774218
    var panoLatitude:String = ""
    var panoLongitude:String = ""
    @IBOutlet weak var panoView: GMSPanoramaView!
    override func viewDidLoad() {
        super.viewDidLoad()
            let panoLa=Double(panoLatitude)
        
            let panoLo=Double(panoLongitude)
            print(panoLa)
            print(panoLo)
        GMSPanoramaService().requestPanoramaNearCoordinate(CLLocationCoordinate2D(latitude: panoLa!, longitude:panoLo!)) { (pano, error) in
            if error != nil{
                print(error!.localizedDescription)
                return
            }
            self.panoView.panorama=pano
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
