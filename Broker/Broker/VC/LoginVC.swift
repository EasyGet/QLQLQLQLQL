//
//  LoginVC.swift
//  Broker
//
//  Created by Richie on 16/2/15.
//  Copyright © 2016年 DabaiDoctor. All rights reserved.
//

import UIKit

class LoginVC: BaseVC {

    @IBOutlet weak var phoneNo: UITextField!
    
    @IBOutlet weak var 验证码输入框: UITextField!
    @IBOutlet weak var 昵称输入框: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func 发送验证码(sender: AnyObject) {
        phoneNo.resignFirstResponder()
        
        if phoneNo.text!.isPhoneNo() {
            
            if !验证码输入框.hidden {
                验证码输入框.hidden = true
                昵称输入框.hidden = true
            }
        } else {
            let 警告框 = UIAlertController(title: "错误", message: "请输入正确的手机号码!", preferredStyle: .Alert)
            let 确定按钮 = UIAlertAction(title: "确定", style: .Cancel, handler: { (action: UIAlertAction) -> Void in
                
                self.phoneNo.becomeFirstResponder()
            })
            警告框.addAction(确定按钮)
            
            if phoneNo.text?.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) > 0 {
                print(phoneNo.text)
                let 清空 = UIAlertAction(title: "清空", style: .Default, handler: { (action: UIAlertAction) -> Void in
                    self.phoneNo.text = ""
                    self.phoneNo.becomeFirstResponder()
                })
                警告框.addAction(清空)
            }
            
            self.presentViewController(警告框, animated: true, completion: nil)
        }
        
        
    }
}
