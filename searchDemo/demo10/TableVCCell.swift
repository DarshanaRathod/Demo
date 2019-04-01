//
//  TableVCCell.swift
//  demo10
//
//  Created by iOS Team Lead on 12/12/18.
//  Copyright © 2018 iOS Team Lead. All rights reserved.
//

import UIKit

class TableVCCell: UITableViewCell {

    @IBOutlet weak var imgData: UIImageView!
    @IBOutlet weak var lblSong: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
