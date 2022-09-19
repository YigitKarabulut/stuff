//
//  MyAdvertsTableViewCell.swift
//  stuff
//
//  Created by Yigit on 14.09.2022.
//

import UIKit

class MyAdvertsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblAdvertName: UILabel!
    
    @IBOutlet weak var btnStatus: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
