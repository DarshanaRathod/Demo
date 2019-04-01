//
//  SearchVC.swift
//  demo10
//
//  Created by iOS Team Lead on 12/12/18.
//  Copyright © 2018 iOS Team Lead. All rights reserved.
//

import UIKit

class SearchVC: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UITextFieldDelegate{

    @IBOutlet weak var btnRefresh: UIButton!
    @IBOutlet weak var tbldata: UITableView!
    @IBOutlet weak var txtsearch: UITextField!
    @IBOutlet weak var txtsearchhight: NSLayoutConstraint!
    
    var arrimages = NSMutableArray()
    var arrSong = ["ghj","abcd","retr","vbb"]
    var arrName = ["asd","fgh","jkl","wert"]
    var searchActive : Bool = false
    var data = ["San Francisco","New York","San Jose","Chicago","Los Angeles","Austin","Seattle"]
    var filtered:[String] = []
    
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()

        arrimages = ["download (1)","download (2)","download (3)","download (4)"]
        btnRefresh.layer.cornerRadius = 13 // this value vary as per your desire
        btnRefresh.clipsToBounds = true
        
        btnRefresh.layer.borderWidth = 1
        btnRefresh.layer.borderColor = UIColor.white.cgColor
        
        txtsearch.layer.cornerRadius = txtsearch.frame.size.height/2
        txtsearch.clipsToBounds = true
       
     //   txtsearch.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)),
                          //  for: UIControl.Event.editingChanged)
     
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive){
            return filtered.count
        } else {
            return arrName.count
        }
        
       return arrimages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "TableVCCell", for: indexPath) as! TableVCCell
        cell.imgData.image = UIImage(named: arrimages[indexPath.row] as! String)
        cell.lblSong.text = arrSong[indexPath.row] as String
        cell.lblName.text = arrName[indexPath.row] as String
        cell.selectionStyle = .none
        
        if(searchActive){
            cell.lblName.text = filtered[indexPath.row]
        } else {
            cell.lblName.text = arrName[indexPath.row];
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        
    }
    
    @IBAction func btnrefreshclick(_ sender: UIButton) {
        let searchText  = txtsearch.text
        filtered = arrName.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: txtsearch.text!, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tbldata.reloadData()
        
    }
  //  @objc func textFieldDidChange(_ textField: UITextField) {
        
       
}

