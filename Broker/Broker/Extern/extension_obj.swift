//
//  extension_obj.swift
//  Broker
//
//  Created by Richie on 16/2/9.
//  Copyright © 2016年 DabaiDoctor. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    
    func addBorder(cornerRadius:CGFloat, borderWidth:CGFloat, color:UIColor) ->Void {
        let layer = self.layer
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
        layer.shouldRasterize = false
        layer.rasterizationScale = 2
        layer.masksToBounds = true
        layer.borderColor = color.CGColor
    }
}