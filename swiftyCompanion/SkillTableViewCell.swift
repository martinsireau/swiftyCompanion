//
//  SkillTableViewCell.swift
//  swiftyCompanion
//
//  Created by Martin SIREAU on 20/10/2017.
//  Copyright © 2017 Martin SIREAU. All rights reserved.
//

import UIKit

class SkillTableViewCell: UITableViewCell {

    @IBOutlet weak var skillProgressBar: UIProgressView!
    @IBOutlet weak var nameAndLevelLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
