//
//  ProductCVCell.swift
//  Arkfull
//
//  Created by Sushobhit_BuiltByBlank on 8/2/16.
//  Copyright © 2016 Built by Blank India Pvt. Ltd. All rights reserved.
//

import UIKit

class ProductCVCell: UICollectionViewCell {

    @IBOutlet weak var addToBoxBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = UIColor.init(red: 211/255, green: 211/255, blue: 211/255, alpha: 0.8).CGColor
        self.layer.borderWidth = 1
        // Initialization code
    }

}
