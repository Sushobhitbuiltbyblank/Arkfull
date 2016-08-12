//
//  YouVC.swift
//  Arkfull
//
//  Created by Sushobhit_BuiltByBlank on 8/8/16.
//  Copyright © 2016 Built by Blank India Pvt. Ltd. All rights reserved.
//

import UIKit

class YouVC: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var avtarImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var items:NSMutableArray = ["","",""]
    let reuseIdentifier = "boxTVCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes =
            [ NSFontAttributeName: UIFont(name: "FuturaStd-CondensedBold", size: 15)!]
        self.title = self.navigationController?.tabBarItem.title
        avtarImage.layer.cornerRadius = 35
        avtarImage.clipsToBounds = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BoxTVCell
        
        
        
        
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
