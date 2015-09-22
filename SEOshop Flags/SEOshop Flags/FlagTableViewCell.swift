//
//  FlagTableViewCell.swift
//  SEOshop Flags
//
//  Created by Hidde van der Ploeg on 21/09/15.
//  Copyright © 2015 Hidde van der Ploeg. All rights reserved.
//

import UIKit

class FlagTableViewCell: UITableViewCell {

    @IBOutlet var countryImage: UIImageView!
    @IBOutlet var countryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        countryImage.layer.shadowColor = UIColor.blackColor().CGColor
        countryImage.layer.shadowOffset = CGSizeMake(0, 1)
        countryImage.layer.shadowRadius = 2
        countryImage.layer.shadowOpacity = 0.15
    }

}
