//
//  ProfileTableViewCell.swift
//  stuff
//
//  Created by Yigit on 22.09.2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var lblFirstSecond: UILabel!
    
    
    @IBOutlet weak var lblCityTown: UILabel!
    
    
    
    
    @IBOutlet weak var lblPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
