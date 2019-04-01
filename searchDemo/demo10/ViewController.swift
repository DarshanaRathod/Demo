//
//  ViewController.swift
//  demo10
//
//  Created by iOS Team Lead on 11/12/18.
//  Copyright © 2018 iOS Team Lead. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var arrimages = NSMutableArray()
    
    
    @IBOutlet weak var imgShow: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrimages = ["download (1)","download (2)","download (3)","download (4)"]
        // Do any additional setup after loading the view, typically from a nib.
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrimages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionVC", for: indexPath as IndexPath) as! CollectionVC
       // let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionVC, for: indexPath) as CollectionVC!
        
        cell.imgdata.image = UIImage(named: arrimages[indexPath.row] as! String)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        imgShow.image = UIImage(named: arrimages[indexPath.row] as! String)
        
        
    }
}

