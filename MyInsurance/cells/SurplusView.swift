//
//  SurplusView.swift
//  MyInsurance
//
//  Created by ehab on 2/4/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import UIKit
import DropDown

class SurplusView: UIView {
    @IBOutlet var dropDownAnchorsViews: [UILabel]!
    var vehicleMakeDropDown = DropDown()
    var buttonsClick : OrderPageButtonsClick!
    override func awakeFromNib() {
        setupDropDowns()
        setupActions()
    }
    @IBAction func saveBtnDidTapped(_ sender: Any) {
        buttonsClick.next(index: 0)
    }
    
    func setupDropDowns(){
        vehicleMakeDropDown.anchorView = dropDownAnchorsViews[0]
        let nationGes = UITapGestureRecognizer(target: self, action: #selector(vehicleMakeDropDownClick))
        configLable(index: 0, ges: nationGes)
    }
    
    func configLable(index : Int , ges : UITapGestureRecognizer){
        dropDownAnchorsViews[index].addGestureRecognizer(ges)
        dropDownAnchorsViews[index].isUserInteractionEnabled = true
        dropDownAnchorsViews[index].layer.borderColor = UIColor.blue.cgColor
        dropDownAnchorsViews[index].layer.borderWidth = 0.5
        dropDownAnchorsViews[index].layer.cornerRadius = 8
    }
    
    func setupActions(){
        vehicleMakeDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
               self.dropDownAnchorsViews[0].text = item
           }
    }
    
    @objc func vehicleMakeDropDownClick(){
        self.vehicleMakeDropDown.show()
    }
}
