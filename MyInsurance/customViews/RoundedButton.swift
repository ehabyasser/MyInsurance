//
//  RoundedButton.swift
//  MyInsurance
//
//  Created by ehab on 1/26/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class RoundedButton: UIButton{
    override func layoutSubviews() {
        super.layoutSubviews()
        updateCornerRadius()
    }

    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }

    func updateCornerRadius() {
        layer.cornerRadius = rounded ? 8 : 0
    }
}
