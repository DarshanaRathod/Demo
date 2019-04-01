//
//  portableVC.swift
//  demo10
//
//  Created by iOS Team Lead on 11/12/18.
//  Copyright © 2018 iOS Team Lead. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class portableVC: UIViewController {

    @IBOutlet weak var txtDomain: UITextField!
    @IBOutlet weak var txtTerritory: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnNextclick(_ sender: UIButton) {
        WBPort()
        
    }
    
    func WBPort() {
        
        
        txtDomain.text = "helsinn.gmheventweb.com"
        txtTerritory.text = "110302"
      
        
        let strURL = "http://app.gmheventweb.com/api/application/getSettings?domain=\(txtDomain.text!)&territoryNumber=\(txtTerritory.text!)"
            print(strURL)
            Alamofire.request(strURL, method: .get, parameters: nil, encoding: JSONEncoding.default)
        
                .responseJSON { response in
                    print(response)
                    if response.result.value != nil
                    {
                        
                        let resData = response.result.value as! NSDictionary
                        
                        
//                            let Domain = self.txtDomain.text
//                            print(Domain)
//                            let territory = self.txtTerritory.text
//                            print(territory)
                           
                    }
                    else
                    {
                        
                        print("Try Again")
                    }
            }
        }
}


