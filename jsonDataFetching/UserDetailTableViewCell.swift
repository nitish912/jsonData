//
//  UserDetailTableViewCell.swift
//  jsonDataFetching
//
//  Created by Xelpmoc Mac on 27/05/20.
//  Copyright © 2020 Xelpmoc Mac. All rights reserved.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {

    
    @IBOutlet weak var userimg: UIImageView!
    
    @IBOutlet weak var username: UILabel!
    
    
    @IBOutlet weak var userage: UILabel!
    
    @IBOutlet weak var userlocation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
                       userimg.layer.borderWidth = 0.5
                        userimg.layer.masksToBounds = false
                       userimg.layer.borderColor = UIColor.white.cgColor
                        userimg.layer.cornerRadius = userimg.frame.height/2
                       userimg.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
        // Configure the view for the selected state
    }
    
}
