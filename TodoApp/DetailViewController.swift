//
//  DetailViewController.swift
//  TodoApp
//
//  Created by Weslley Neri on 29/11/15.
//  Copyright © 2015 Weslley Neri. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    
    var toDoData = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.userInteractionEnabled = false
        notesTextView.userInteractionEnabled  = false
        
        titleTextField.text = toDoData.objectForKey("itemTitle") as? String
        notesTextView.text = toDoData.objectForKey("itemNote") as? String

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func deleteAction() {
        let userDefault = NSUserDefaults.standardUserDefaults()
        
        let itemListArray = userDefault.objectForKey("itemList") as! NSMutableArray
        
        let multableItemList = NSMutableArray()
        
        for dict:AnyObject in itemListArray{
            multableItemList.addObject(dict as! NSDictionary)
        }
        
        multableItemList.removeObject(toDoData)
        userDefault.removeObjectForKey("itemList")
        userDefault.setObject(multableItemList, forKey: "itemList")
        userDefault.synchronize()
    }
    
    @IBAction func deleteAction(sender: AnyObject) {
        let refreshAlert = UIAlertController(title: "Delete", message: "Você tem certeza que deseja deletar?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        refreshAlert.addAction(UIAlertAction(title: "Apagar", style: .Default, handler: { (action: UIAlertAction!) in
            self.deleteAction()
            self.navigationController?.popToRootViewControllerAnimated(true)
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancelar", style: .Default, handler: { (action: UIAlertAction!) in
            return
        }))
        
        presentViewController(refreshAlert, animated: true, completion: nil)
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
