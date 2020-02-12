//
//  Extensions.swift
//  MyInsurance
//
//  Created by ehab on 1/27/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
  func imageWithInsets(insetDimen: CGFloat) -> UIImage {
    return imageWithInset(insets: UIEdgeInsets(top: insetDimen, left: insetDimen, bottom: insetDimen, right: insetDimen))
  }
  
  func imageWithInset(insets: UIEdgeInsets) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(
        CGSize(width: self.size.width + insets.left + insets.right,
               height: self.size.height + insets.top + insets.bottom), false, self.scale)
    let origin = CGPoint(x: insets.left, y: insets.top)
    self.draw(at: origin)
    let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return imageWithInsets!
  }
  
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension UIView {

    @IBInspectable var cornerRadiusV: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidthV: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColorV: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

extension UIView {
    class func fromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
    class func fromNib<T: UIView>(name:String , index : Int) -> T {
        return Bundle.main.loadNibNamed(name, owner: nil, options: nil)![index] as! T
    }
}
