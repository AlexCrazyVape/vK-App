//
//  ShadowView.swift
//  vK-App
//
//  Created by ZveroKos.TV on 01.02.2020.
//  Copyright © 2020 Aleksandr Kosarev. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowView: UIView {
    
    @IBInspectable
    var shadowViewColor: UIColor = UIColor.white {
        didSet {
            updateShadowColor()
        }
    }
    
    @IBInspectable
    var shadowViewRadius: CGFloat = 0 {
        didSet {
            updateShadowRadius()
        }
    }
    
    @IBInspectable
    var shadowViewOpacity: Float = 0 {
        didSet {
            updateShadowOpacity()
        }
    }
    
    private func updateShadowColor() {
        self.layer.shadowColor = shadowViewColor.cgColor
    }
    
    private func updateShadowRadius() {
        self.layer.shadowRadius = shadowViewRadius
    }
    
    private func updateShadowOpacity() {
        self.layer.shadowOpacity = shadowViewOpacity
    }
}

