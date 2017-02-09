//
//  SmallButton.swift
//  Resuscitation2
//
//  Created by Anan Lappikulthong on 1/13/17.
//  Copyright © 2017 Anan Lappikulthong. All rights reserved.
//

import UIKit

class SmallButton: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        
    }
}
