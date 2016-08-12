//
//  BoxDetailVC.swift
//  Arkfull
//
//  Created by Sushobhit_BuiltByBlank on 8/9/16.
//  Copyright © 2016 Built by Blank India Pvt. Ltd. All rights reserved.
//

import UIKit

class BoxDetailVC: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource  {
    
    @IBOutlet weak var addToCartBtn: UIButton!
    @IBOutlet weak var headerView: UIView!
    let identifier = "ProductCVCell"
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.headerView.layer.borderWidth = 1
        self.headerView.layer.borderColor = UIColor.lightGrayColor().CGColor
        addToCartBtn.layer.borderWidth = 1
        addToCartBtn.layer.borderColor = UIColor.lightGrayColor().CGColor

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
        cell.addToBoxBtn.hidden = true
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
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
