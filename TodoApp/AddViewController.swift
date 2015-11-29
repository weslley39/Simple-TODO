//
//  AddViewController.swift
//  TodoApp
//
//  Created by Weslley Neri on 29/11/15.
//  Copyright © 2015 Weslley Neri. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var titleTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemList = userDefaults.objectForKey("itemList") as? NSMutableArray
        
        let dataSet = NSMutableDictionary()
        dataSet.setObject(titleTextFiled.text!, forKey: "itemTitle")
        dataSet.setObject(notesTextView.text, forKey: "itemNote")
        
        if ((itemList) != nil){ //data already exists
            let multableList = NSMutableArray()
            for dict:AnyObject in itemList!{
                multableList.addObject(dict as! NSDictionary)
            }
            multableList.addObject(dataSet)
            
            userDefaults.removeObjectForKey("itemList")
            userDefaults.setObject(multableList, forKey: "itemList")
        } else { //this is the first todo item in the list
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
