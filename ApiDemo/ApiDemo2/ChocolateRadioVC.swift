//
//  ChocolateRadioVC.swift
//  ApiDemo2
//
//  Created by Stegowl on 31/08/18.
//  Copyright © 2018 Stegowl. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ChocolateRadioVC: UIViewController {
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPhone: UITextField!
    @IBAction func btnSignup(_ sender: UIButton) {
        WBGenresDetails()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //WBGenresDetails()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func WBGenresDetails()
    {
        
        let  url = "http://durisimomobileapps.net/chocolateradio/api/signup"
        let parameter = ["signup_email":txtEmail.text,
                         "signup_phone":txtPhone.text] as [String:AnyObject]
        
        
        print("\n\n\n\n Forget Password")
        print(parameter)
        print(url)
        
        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default).responseJSON{ Response in
            print(Response)
            
            if Response.result.value != nil
            {
                let result = Response.result.value as! NSDictionary
                let status = result["status"] as! NSNumber
                print(result)
                if status == 1{
                    self.txtEmail.text = ""
                    self.txtPhone.text = ""
                   // let data = result["data"] as! NSArray
                    //self.arrList = data.mutableCopy() as! NSMutableArray
                    
                    //self.tblDetails.reloadData()
                }
                else
                {
                    // self.showMyAlert(myMessage: result["msg"] as! String)
                }
            }
            else
            {
                print("Sign up Unseuccessfull")
                
            }
        }
    }
}
