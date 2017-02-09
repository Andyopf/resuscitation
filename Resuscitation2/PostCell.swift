//
//  PostCell.swift
//  Resuscitation2
//
//  Created by Anan Lappikulthong on 1/13/17.
//  Copyright © 2017 Anan Lappikulthong. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var eventLbl: UILabel!
    @IBOutlet weak var timeLineLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(post: Post) {
        eventLbl.text = post.drugPath
        timeLineLbl.text = "\(post.timePath)"
    }
    
}
