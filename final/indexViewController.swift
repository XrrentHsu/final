//
//  indexViewController.swift
//  final
//
//  Created by User18 on 2018/12/28.
//  Copyright © 2018 chen. All rights reserved.
//

import UIKit
class indexViewController: UIViewController {

    @IBOutlet weak var frontWheel: UIImageView!
    @IBOutlet weak var whiteView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        frontWheel.layer.cornerRadius=frontWheel.frame.size.width/2
        frontWheel.clipsToBounds=true
        whiteView.layer.cornerRadius=frontWheel.frame.size.width/2
        whiteView.clipsToBounds=true
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z") // 让其在z轴旋转
        rotationAnimation.toValue = NSNumber(value: M_PI * 2.0) // 旋转角度
        rotationAnimation.duration = 2// 旋转周期
        rotationAnimation.isCumulative = true // 旋转累加角度
        rotationAnimation.repeatCount = 100000 // 旋转次数
        rotationAnimation.isRemovedOnCompletion = false
        whiteView.layer.add(rotationAnimation,forKey: nil)
        frontWheel.layer.add(rotationAnimation, forKey: nil)
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
