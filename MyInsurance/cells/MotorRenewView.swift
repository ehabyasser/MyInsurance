//
//  MotorRenewView.swift
//  MyInsurance
//
//  Created by ehab on 2/4/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import UIKit

class MotorRenewView: UIView {
    
    var buttonsClick : OrderPageButtonsClick!
    
    override func awakeFromNib() {
    }
    
    @IBAction func saveBtnDidTapped(_ sender: Any) {
        buttonsClick.next(index: 0)
    }
}
