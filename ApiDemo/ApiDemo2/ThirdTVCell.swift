//
//  ThirdTVCell.swift
//  ApiDemo2
//
//  Created by Stegowl on 30/08/18.
//  Copyright © 2018 Stegowl. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ThirdTVCell: UITableViewCell {

    
    @IBOutlet weak var lblLink: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var btncellclick: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
