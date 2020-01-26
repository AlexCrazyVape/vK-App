//
//  GroupsTableViewCell.swift
//  vK-App
//
//  Created by ZveroKos.TV on 26.01.2020.
//  Copyright © 2020 Aleksandr Kosarev. All rights reserved.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var allGroupsImage: UIImageView!
    @IBOutlet weak var allGroupsName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
