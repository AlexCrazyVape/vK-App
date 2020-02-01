//
//  CustomCell.swift
//  vK-App
//
//  Created by ZveroKos.TV on 01.02.2020.
//  Copyright © 2020 Aleksandr Kosarev. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var shadowView: ShadowView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupImageUI()
        setupShadowView()
    }
    
    func setupImageUI() {
        thumbnailImageView.layer.cornerRadius = thumbnailImageView.bounds.width / 2
    }
    
    func setupShadowView() {
        shadowView.layer.cornerRadius = shadowView.bounds.width / 2
        shadowView.backgroundColor = .white
        shadowView.layer.borderWidth = 1
        shadowView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        shadowView.layer.shadowOffset = .zero
    }
}
