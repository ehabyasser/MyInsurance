//
//  AdditionalDetails.swift
//  MyInsurance
//
//  Created by ehab on 2/4/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import Foundation
import UIKit
import DLRadioButton

class AdditionalDetails: UIView{
    @IBOutlet var btns: [DLRadioButton]!
    var buttonsClick : OrderPageButtonsClick!
   
    override func awakeFromNib() {
        for btn in self.btns {
            btn.titleLabel?.adjustsFontSizeToFitWidth = true
        }
    }
    
    @IBAction func radioBtnClick(_ sender: DLRadioButton) {
        for btn in self.btns {
            btn.isSelected = (btn == sender) ? true: false
        }
    }
    
    @IBAction func backBtnDidTapped(_ sender: Any) {
        buttonsClick.back(index: 2)
    }
    @IBAction func nextBtnDidTapped(_ sender: Any) {
        buttonsClick.next(index: 2)
    }
}
