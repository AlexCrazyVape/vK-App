//
//  MyFriendsTableViewCell.swift
//  vK-App
//
//  Created by ZveroKos.TV on 27.01.2020.
//  Copyright © 2020 Aleksandr Kosarev. All rights reserved.
//

import UIKit

class MyFriendsTableViewCell: UITableViewCell {


    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var username: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatar.layer.cornerRadius = avatar.frame.size.height / 2
        avatar.contentMode = .scaleAspectFill
        avatar.layer.masksToBounds = true
        
        
    //    avatarView.borderWidth = 2
    //    avatarView.cornerRadius = 20
    //    avatarView.shadowColor
    //    avatarView.layer.shadowOpacity = 0.5
    //    avatarView.layer.shadowRadius = 8
    //    avatarView.layer.shadowOffset = CGSize.zero
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension UIView {
    
   /// Радиус гараницы
    @IBInspectable var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue  }
        get { return layer.cornerRadius }
    }
    /// Толщина границы
    @IBInspectable var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    /// Цвет границы
    @IBInspectable var borderColor: UIColor? {
        set { layer.borderColor = newValue?.cgColor  }
        get {  return UIColor(cgColor: layer.borderColor!) }
    }
    /// Смещение тени
    @IBInspectable var shadowOffset: CGSize {
        set { layer.shadowOffset = newValue  }
        get { return layer.shadowOffset }
    }
    /// Прозрачность тени
    @IBInspectable var shadowOpacity: Float {
        set { layer.shadowOpacity = newValue }
        get { return layer.shadowOpacity }
    }
    /// Радиус блура тени
    @IBInspectable var shadowRadius: CGFloat {
        set {  layer.shadowRadius = newValue }
        get { return layer.shadowRadius }
    }
    /// Цвет тени
    @IBInspectable var shadowColor: UIColor? {
        set { layer.shadowColor = newValue?.cgColor }
        get {  return UIColor(cgColor: layer.shadowColor!) }
    }
    /// Отсекание по границе
    @IBInspectable var _clipsToBounds: Bool {
        set { clipsToBounds = newValue }
        get { return clipsToBounds }
    }
}
