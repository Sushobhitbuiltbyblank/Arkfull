//
//  BoxTVCell.swift
//  Arkfull
//
//  Created by Sushobhit_BuiltByBlank on 8/8/16.
//  Copyright © 2016 Built by Blank India Pvt. Ltd. All rights reserved.
//

import UIKit

class BoxTVCell: UITableViewCell {

    @IBOutlet weak var addToCartBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        addToCartBtn.layer.borderWidth = 1
        addToCartBtn.layer.borderColor = UIColor.lightGrayColor().CGColor
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
