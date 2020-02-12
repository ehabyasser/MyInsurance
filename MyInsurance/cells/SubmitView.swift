//
//  SubmitView.swift
//  MyInsurance
//
//  Created by ehab on 2/4/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import Foundation
import UIKit

class SubmitView: UIView {
    var buttonsClick : OrderPageButtonsClick!
    override func awakeFromNib() {
        
    }
    
    @IBAction func backBtnDidTapped(_ sender: Any) {
        buttonsClick.back(index: 3)
    }
    @IBAction func saveBtnDidTapped(_ sender: Any) {
        buttonsClick.next(index: 3)
    }
}
