//
//  FourthVC.swift
//  ApiDemo2
//
//  Created by Stegowl on 30/08/18.
//  Copyright © 2018 Stegowl. All rights reserved.
//

import UIKit
import WebKit
import Alamofire
import SwiftyJSON
import SafariServices


class FourthVC: UIViewController,WKNavigationDelegate {

    var strlink = ""
    @IBOutlet weak var viewweb: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         viewweb.navigationDelegate = self
        let url = URL(string: "https://www.hackingwithswift.com/read/4/2/creating-a-simple-browser-with-wkwebview")!
        viewweb.load(URLRequest(url: url))
        viewweb.allowsBackForwardNavigationGestures = true
        
        
//        let url = URL (string: strlink)
//        let requestObj = URLRequest(url: url!)
//        viewweb.load(requestObj)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    

}
