//
//  KKTools.swift
//  Broker
//
//  Created by Richie on 16/2/4.
//  Copyright © 2016年 DabaiDoctor. All rights reserved.
//

import UIKit

/*
    for tools constan
*/



class KKTools: NSObject {

//    4ec2e9
    static var defaultBlue: UIColor = UIColor(red: 0x4e / 255.0, green: 0xc2 / 255.0, blue: 0xe9 / 255.0, alpha: 1);
    
    
    class func MenuList() ->NSDictionary? {
        return NSMutableDictionary(contentsOfFile: NSBundle.mainBundle().pathForResource("Menu", ofType: "plist")!);
    }
}


extension String {
    func isPhoneNo() -> Bool {        
        let regex = "^((13[0-9])|(147)|(15[^4,\\D])|(18[^4,\\D])|(17[6,7]))\\d{8}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluateWithObject(self)
    }
}

