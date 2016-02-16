//
//  FriendCell.swift
//  Broker
//
//  Created by Richie on 16/2/9.
//  Copyright © 2016年 DabaiDoctor. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet weak var headerImg: UIImageView!
    @IBOutlet weak var nameLab: UILabel!
    @IBOutlet weak var messageLab: UILabel!
    @IBOutlet weak var wechatImg: UIImageView!
    
    var bingWechat = false {
        willSet(newVal) {
            wechatImg.image = UIImage(named: "微信-灰大")
        }
        didSet {
            if bingWechat {
                wechatImg.image = UIImage(named: "微信-亮大")
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        headerImg.addBorder(5, borderWidth: 0.5, color: UIColor.lightGrayColor())
        // Initialization code
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    //MARK
    
}
