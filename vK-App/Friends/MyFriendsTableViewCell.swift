//
//  MyFriendsTableViewCell.swift
//  vK-App
//
//  Created by ZveroKos.TV on 27.01.2020.
//  Copyright © 2020 Aleksandr Kosarev. All rights reserved.
//

import UIKit

class MyFriendsTableViewCell: UITableViewCell {


    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var username: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatar.layer.cornerRadius = avatar.frame.size.height / 2
        avatar.contentMode = .scaleAspectFill
        avatar.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
