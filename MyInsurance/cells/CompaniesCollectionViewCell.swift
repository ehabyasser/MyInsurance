//
//  CompaniesCollectionViewCell.swift
//  MyInsurance
//
//  Created by ehab on 1/26/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import UIKit

class CompaniesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var companyImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 4
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.red.cgColor
    }

}
