//
//  GenresDetailsVC.swift
//  ApiDemo2
//
//  Created by Stegowl on 31/08/18.
//  Copyright © 2018 Stegowl. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage
import Alamofire
class cellGenresDetails: UITableViewCell{
    
    @IBOutlet weak var lblNAme: UILabel!
    
    
}
class GenresDetailsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var genres_id = NSNumber()
    var arrList = NSMutableArray()
    @IBOutlet weak var tblDetails: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblDetails.delegate = self
        tblDetails.dataSource = self
        //   WBList()
        WBGenresDetails()
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
        return arrList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellGenresDetails", for: indexPath) as! cellGenresDetails
        
        cell.lblNAme.text = (arrList[indexPath.row] as AnyObject)["song_name"] as? String
        
        return cell
    }
    func WBList()
    {
        let strUrl = "http://durisimomobileapps.net/chocolateradio/api/genres_song"
        print(strUrl)
       
        let parameter = ["genres_id":genres_id,
        "u_id":"580FD47D-1BE6-44F5-847C-FC5D882EF415"] as [String:AnyObject]
        
        //AFWrapper.requestGETURL(strUrl, success:{ (JSONResponse) -> Void in
        AFWrapper.requestPOSTURL(strUrl, params: parameter, headers: nil, success: { (Response) -> Void in
            print(Response)
            if Response != JSON.null {
                let status = Response["status"].int
                            if status == 1 {
                   
//                    let data = Response["data"] as! NSArray
//                    self.arrList = data.mutableCopy() as! NSMutableArray
                   // let data = result["data"] as! NSArray
                   // self.arrList = data.mutableCopy() as! NSMutableArray
                    self.tblDetails.reloadData()
                }
                else{
                    print(Response["msg"] as! String)
                }
            }
        }){ (error) -> Void in
            print(error)
            
        }
    }
    func WBGenresDetails()
    {
        
        let  url = "http://durisimomobileapps.net/chocolateradio/api/genres_song"
        let parameter = ["genres_id":genres_id,
                         "u_id":"580FD47D-1BE6-44F5-847C-FC5D882EF415"] as [String:AnyObject]
        
        
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
                    let data = result["data"] as! NSArray
                    self.arrList = data.mutableCopy() as! NSMutableArray
                    
                    self.tblDetails.reloadData()
                }
                else
                {
                   // self.showMyAlert(myMessage: result["msg"] as! String)
                }
            }
            else
            {
                print("No Internet Connection")
                
            }
        }
    }
    

}
