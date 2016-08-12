//
//  AddToNewBoxVC.swift
//  Arkfull
//
//  Created by Sushobhit_BuiltByBlank on 8/11/16.
//  Copyright © 2016 Built by Blank India Pvt. Ltd. All rights reserved.
//

import UIKit

class AddToNewBoxVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var items:NSMutableArray = ["HATS","CAPS","FOR MOM"]
    let reuseIdentifier = "BoxNameCell"
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var boxNameTF: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        boxNameTF.layer.borderColor = UIColor.whiteColor().CGColor
        boxNameTF.layer.borderWidth = 1
        boxNameTF.attributedPlaceholder = NSAttributedString(string:"  BOX NAME", attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        self.saveBtn.layer.borderWidth = 1
        self.saveBtn.layer.borderColor = UIColor.whiteColor().CGColor
        tableView.registerNib(UINib(nibName: "BoxNameTVCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func closeBtnAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BoxNameTVCell
        cell.nameLable.text = items.objectAtIndex(indexPath.row) as? String
        
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
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
