//
//  ThePlantView.swift
//  MyInsurance
//
//  Created by ehab on 2/4/20.
//  Copyright © 2020 ehab. All rights reserved.
//
import UIKit
import Foundation


class ThePlantView : UIView {
    
    @IBOutlet weak var priceLbl: UIPaddedLabel!
    var buttonsClick : OrderPageButtonsClick!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    @IBAction func backBtnDidTapped(_ sender: Any) {
        buttonsClick.back(index: 1)
    }
    @IBAction func saveBtnDidTapped(_ sender: Any) {
        buttonsClick.next(index: 1)
    }
}
