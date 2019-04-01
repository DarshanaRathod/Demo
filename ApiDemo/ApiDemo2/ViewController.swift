//
//  ViewController.swift
//  ApiDemo2
//
//  Created by Stegowl on 29/08/18.
//  Copyright © 2018 Stegowl. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage


class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{

    
    @IBOutlet weak var tblData: UITableView!
    var arrList = NSMutableArray()
    var myImage = UIImage()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        WBList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "APITableViewCell", for: indexPath) as! APITableViewCell
         
        cell.lblName.text = (arrList[indexPath.row] as AnyObject)["genres_name"] as? String
        
        cell.lblCount.text = "\((arrList[indexPath.row] as AnyObject) ["total_count"] as! NSNumber)"
        let img_url = URL(string:((arrList[indexPath.row] as AnyObject)["image"] as? String)!)
        print(img_url)
        cell.imgData.sd_setImage(with: img_url, placeholderImage: UIImage(named: "PlaceHolder"), options: SDWebImageOptions.continueInBackground)
      
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "GenresDetailsVC") as! GenresDetailsVC
        vc.genres_id = ((arrList[indexPath.row] as AnyObject)["genres_id"] as? NSNumber)!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func WBList()
    {
        let strUrl = "http://durisimomobileapps.net/chocolateradio/api/genres"
        print(strUrl)
        AFWrapper.requestGETURL(strUrl, success:{ (JSONResponse) -> Void in
            if let resData = JSONResponse.dictionaryObject {
                let status = resData["status"] as! NSNumber
                if status == 1 {
                    self.arrList = (resData["data"] as! NSArray).mutableCopy() as! NSMutableArray
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

