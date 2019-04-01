//
//  SecondVC.swift
//  ApiDemo2
//
//  Created by Stegowl on 30/08/18.
//  Copyright © 2018 Stegowl. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class SecondVC: UIViewController, UITableViewDataSource , UITableViewDelegate {

     var dictList = NSMutableDictionary()
    var arrList = NSMutableArray()
    var myImage = UIImage()
    @IBOutlet weak var tblData: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        WBList()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // arrList = dictList
        return 1//arrList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTVCell", for: indexPath) as! SecondTVCell
        
        arrList[indexPath.row] = dictList
        
        cell.lblName.text = (arrList[indexPath.row] as AnyObject)["title"] as? String
        
        print(cell.lblName.text = (arrList[indexPath.row] as AnyObject)["title"] as? String)
        let img_url = URL(string: (dictList["image"] as AnyObject).string ?? "")
        cell.imgData.sd_setImage(with: img_url, placeholderImage: UIImage(named: "PlaceHolder"), options: SDWebImageOptions.continueInBackground)
        return cell
    }
    
    func WBList()
    {
        let strUrl = "http://durisimomobileapps.net/chocolateradio/api/radio"
        print(strUrl)
        AFWrapper.requestGETURL(strUrl, success:{ (JSONResponse) -> Void in
            if let resData = JSONResponse.dictionaryObject {
                let status = resData["status"] as! NSNumber
                if status == 1 {
                    self.dictList = (resData["data"] as! NSDictionary).mutableCopy() as! NSMutableDictionary
                    self.tblData.reloadData()
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
