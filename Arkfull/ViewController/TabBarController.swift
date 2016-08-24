//
//  TabBarController.swift
//  Arkfull
//
//  Created by Sushobhit_BuiltByBlank on 8/8/16.
//  Copyright © 2016 Built by Blank India Pvt. Ltd. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.items![0].setTitleTextAttributes([NSFontAttributeName: UIFont(name:"FuturaStd-CondensedLight", size:12)!], forState: .Normal)
         self.tabBar.items![0].setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blackColor()], forState: .Selected)
        self.tabBar.items![1].setTitleTextAttributes([NSFontAttributeName: UIFont(name:"FuturaStd-CondensedLight", size:12)!], forState: .Normal)
        self.tabBar.items![1].setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blackColor()], forState: .Selected)
        self.tabBar.items![2].setTitleTextAttributes([NSFontAttributeName: UIFont(name:"FuturaStd-CondensedLight", size:12)!], forState: .Normal)
        self.tabBar.items![2].setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blackColor()], forState: .Selected)
        self.tabBar.items![3].setTitleTextAttributes([NSFontAttributeName: UIFont(name:"FuturaStd-CondensedLight", size:12)!], forState: .Normal)
        self.tabBar.items![3].setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blackColor()], forState: .Selected)
        self.tabBar.items![4].setTitleTextAttributes([NSFontAttributeName: UIFont(name:"FuturaStd-CondensedLight", size:12)!], forState: .Normal)
        self.tabBar.items![4].setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blackColor()], forState: .Selected)
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

}
