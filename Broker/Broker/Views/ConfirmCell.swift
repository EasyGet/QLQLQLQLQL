//
//  ConfirmCell.swift
//  Broker
//
//  Created by Richie on 16/2/4.
//  Copyright © 2016年 DabaiDoctor. All rights reserved.
//

import UIKit

class ConfirmCell: UITableViewCell {

    @IBOutlet weak var selection: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textLabel?.backgroundColor = UIColor.clearColor()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selection.highlighted = selected;
        // Configure the view for the selected state
    }
}
