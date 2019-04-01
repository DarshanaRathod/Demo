//
//  ScreenVC.swift
//  demo10
//
//  Created by iOS Team Lead on 11/12/18.
//  Copyright © 2018 iOS Team Lead. All rights reserved.
//

import UIKit

class ScreenVC: UIViewController {
    @IBOutlet weak var img1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        img1.layer.borderWidth = 5
        img1.layer.borderColor = UIColor.white.cgColor

       // img1.layer.borderColor = UIColor.white as! CGColor
        // Do any additional setup after loading the view.
    }

}
