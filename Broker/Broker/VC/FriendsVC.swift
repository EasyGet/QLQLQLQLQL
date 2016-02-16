//
//  FriendsVC.swift
//  Broker
//
//  Created by Richie on 16/2/9.
//  Copyright © 2016年 DabaiDoctor. All rights reserved.
//

import UIKit

class FriendsVC: BaseTableVC {

    
    var dataSource = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerNib(UINib(nibName: "FriendCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "FriendCell")
        
        for i in 0...5 {
            dataSource.addObject(i)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("\(self.navigationItem.leftBarButtonItem)")
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath)

        // Configure the cell...
        
        if cell.isKindOfClass(FriendCell.classForCoder()) {
            let cell2:FriendCell = cell as! FriendCell
            cell2.bingWechat = indexPath.row % 2 == 0
        }

        return cell
    }

    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 22
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 22
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let alertview = UIAlertController(title: "1", message: "\(indexPath)", preferredStyle: UIAlertControllerStyle.Alert)
//        let action1 = UIAlertAction(title: "取消", style: UIAlertActionStyle.Destructive) { (action:UIAlertAction) -> Void in
//            
//        }
//        let action2 = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default) { (action:UIAlertAction) -> Void in
//            
//        }
//        alertview.addAction(action1)
//        alertview.addAction(action2)
//        self.presentViewController(alertview, animated: true) { () -> Void in
//            
//        }
        
        let 弹出 = self.storyboard?.instantiateViewControllerWithIdentifier("FriendsVC")
        let navi = UINavigationController(rootViewController: 弹出!)
        let 弹出外框 = UIPopoverController(contentViewController: navi)
        
        弹出外框.presentPopoverFromRect(CGRect(x: 100, y: 0, width: 500, height: 500), inView: self.view, permittedArrowDirections: .Any, animated: true)
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            dataSource.removeObjectAtIndex(indexPath.row)
            
            /*
            must changed the datasouce if you want to remove the cell 
            guess when deleted tableview will be refreshed
            */
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
           
        } else if editingStyle == .Insert {
        
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let 删除操作 = UITableViewRowAction(style: .Default, title: "删除") { (action: UITableViewRowAction, indexPath:NSIndexPath) -> Void in
            
            let alertVC = UIAlertController(title: "警告", message: "确定要删除", preferredStyle: .Alert)
            
            let 确定 = UIAlertAction(title: "确定", style: UIAlertActionStyle.Destructive, handler: { (alert: UIAlertAction) -> Void in
                self.tableView(tableView, commitEditingStyle: .Delete, forRowAtIndexPath: indexPath);
            })
            
            alertVC.addAction(确定)
            let 取消 = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: { (action: UIAlertAction) -> Void in
                
            })
            
            alertVC.addAction(取消)
            
            let 其他 = UIAlertAction(title: "其它", style: .Destructive, handler: { (action: UIAlertAction) -> Void in
                
            })
            alertVC.addAction(其他)
            
//            self.presentViewController(alertVC, animated: true, completion: { () -> Void in
//                
//            })
        }
        let 恢复操作 = UITableViewRowAction(style: .Normal, title: "电话联系") { (action: UITableViewRowAction, indexPath:NSIndexPath) -> Void in
            
        }
        恢复操作.backgroundColor = KKTools.defaultBlue
        
        return [删除操作, 恢复操作]
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK :
    override func popupVC() {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
}