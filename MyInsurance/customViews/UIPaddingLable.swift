//
//  UIPaddingLable.swift
//  Requests
//
//  Created by developer team on 10/20/19.
//  Copyright © 2019 developer team. All rights reserved.
//

import Foundation
import UIKit

public class UIPaddedLabel: UILabel {

    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 7.0
    @IBInspectable var rightInset: CGFloat = 7.0

    public override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        self.textAlignment = .center
        super.drawText(in: rect.inset(by: insets))
    }

    public override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    public override func sizeToFit() {
        super.sizeThatFits(intrinsicContentSize)
    }
    
    override public func layoutSubviews() {
           if self.tag < 0 {
               if UIApplication.isRTL()  {
                   if self.textAlignment == .right {
                       return
                   }
               } else {
                   if self.textAlignment == .left {
                       return
                   }
               }
           }
           if self.tag < 0 {
               if UIApplication.isRTL()  {
                   self.textAlignment = .right
               } else {
                   self.textAlignment = .left
               }
           }
       }
}
