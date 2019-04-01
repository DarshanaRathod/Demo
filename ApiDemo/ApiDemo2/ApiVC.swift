//
//  ApiVC.swift
//  ApiDemo2
//
//  Created by Stegowl on 31/08/18.
//  Copyright © 2018 Stegowl. All rights reserved.
//

import UIKit
import WebKit
import Alamofire
import SwiftyJSON
import SafariServices
import SDWebImage
class ApiVC: UIViewController {

    var dictList = NSMutableDictionary()
    var arrList = NSMutableArray()
    var myImage = UIImage()
    
    @IBOutlet weak var lblDiscription: UILabel!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var imgData: UIImageView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WBList()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func view(){
        //arrList = dictList
       
        let img_url = URL(string:((arrList[0] as AnyObject)["image"] as? String)!)
        print(img_url)
        self.imgData.sd_setImage(with: img_url, placeholderImage: UIImage(named: "PlaceHolder"), options: SDWebImageOptions.continueInBackground)
        
        //return self
    }
    

    func WBList()
    {
    let strUrl = "http://durisimomobileapps.net/chocolateradio/api/sponsor"
    print(strUrl)
    AFWrapper.requestGETURL(strUrl, success:{ (JSONResponse) -> Void in
    if let resData = JSONResponse.dictionaryObject {
    let status = resData["status"] as! NSNumber
    if status == 1 {
    self.arrList = (resData["data"] as! NSArray).mutableCopy() as! NSMutableArray
        self.lblDiscription.text = (self.arrList[0] as AnyObject)["description"] as? String
        
        self.lblName.text = (self.arrList[0] as AnyObject) ["name"] as! String
    }
    else{
    print(resData["msg"] as! String)
    }
    }
    }){ (error) -> Void in
    print(error)
    
    }
    }

}
