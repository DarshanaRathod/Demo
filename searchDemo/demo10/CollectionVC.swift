//
//  CollectionVC.swift
//  demo10
//
//  Created by iOS Team Lead on 11/12/18.
//  Copyright © 2018 iOS Team Lead. All rights reserved.
//

import UIKit

class CollectionVC: UICollectionViewCell {
    
    @IBOutlet weak var imgdata: UIImageView!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.height/2)
        
    }
    
}
