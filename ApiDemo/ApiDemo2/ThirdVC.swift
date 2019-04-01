//
//  ThirdVC.swift
//  ApiDemo2
//
//  Created by Stegowl on 30/08/18.
//  Copyright © 2018 Stegowl. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ThirdVC: UIViewController , UITableViewDataSource , UITableViewDelegate{

   
    @IBOutlet weak var tblData: UITableView!
    
    var dictList = NSMutableDictionary()
    var arrList = NSMutableArray()
    //var myImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        WBList()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdTVCell", for: indexPath) as! ThirdTVCell
        arrList[indexPath.row] = dictList
        cell.lblName.text = (arrList[indexPath.row] as AnyObject)["text"] as? String
        cell.lblLink.text = (arrList[indexPath.row] as AnyObject)["ios_link"] as? String
        
        cell.btncellclick.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        cell.btncellclick.tag = indexPath.row
        return cell
    }
 
    
    @objc func buttonClicked(_ sender: UIButton)
   {
       let vc = storyboard?.instantiateViewController(withIdentifier: "FourthVC") as! FourthVC
    vc.strlink = ((arrList[sender.tag] as AnyObject)["ios_link"] as? String)!
    self.navigationController?.pushViewController(vc, animated: true)
  }
    
    func WBList()
    {
        let strUrl = "http://durisimomobileapps.net/chocolateradio/api/shareapp"
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

    

