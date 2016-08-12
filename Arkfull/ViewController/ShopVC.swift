//
//  ShopVC.swift
//  Arkfull
//
//  Created by Sushobhit_BuiltByBlank on 8/2/16.
//  Copyright © 2016 Built by Blank India Pvt. Ltd. All rights reserved.
//

import UIKit

class ShopVC: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let identifier = "ProductCVCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes =
            [ NSFontAttributeName: UIFont(name: "FuturaStd-CondensedBold", size: 15)!]
        self.title = self.navigationController?.tabBarItem.title
        collectionView.delegate = self
        self.collectionView.registerNib(UINib(nibName: "ProductCVCell", bundle: nil), forCellWithReuseIdentifier: identifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: - Collection View Delegate Method
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! ProductCVCell
        cell.addToBoxBtn.tag = indexPath.row;
        cell.addToBoxBtn.addTarget(self, action: #selector(addToBoxAction), forControlEvents: .TouchUpInside)
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func addToBoxAction(sender: AnyObject) {
        if  sender.tag == 1{
//            self.boxView.hidden = false
            let addToBoxView = self.storyboard!.instantiateViewControllerWithIdentifier("AddToBox") as! AddToBox
            self.presentViewController(addToBoxView, animated:true, completion:nil)
        
        }
    }
    @IBOutlet weak var boxView: UIView!
    @IBAction func closeBtnAction(sender: AnyObject) {
        boxView.hidden = true
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
