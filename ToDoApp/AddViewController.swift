//
//  AddViewController.swift
//  ToDoApp
//
//  Created by listener on 15/7/3.
//  Copyright (c) 2015年 lxm. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemList:NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray
        
        
        var dataSet:NSMutableDictionary = NSMutableDictionary()
        dataSet.setObject(titleTextField.text, forKey: "itemTitle")
        dataSet.setObject(notesTextView.text, forKey: "itemNote")

        if (itemList != nil) {// data already avaliable
            var newMutableList:NSMutableArray = NSMutableArray()
            
            for dict:AnyObject in itemList! {
                newMutableList.addObject(dict as NSDictionary)
            }
            
            userDefaults.removeObjectForKey("itemList")
            newMutableList.addObject(dataSet)
            userDefaults.setObject(newMutableList, forKey: "itemList")
           
        } else { // This is the first todo item in the list
            userDefaults.removeObjectForKey("itemList")
            itemList = NSMutableArray()
            itemList!.addObject(dataSet)
            userDefaults.setObject(itemList, forKey: "itemList")
        }
        
        userDefaults.synchronize()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
