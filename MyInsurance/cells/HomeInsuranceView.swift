//
//  HomeInsuranceView.swift
//  MyInsurance
//
//  Created by ehab on 2/4/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import UIKit
import DropDown

class HomeInsuranceView: UIView {
    @IBOutlet weak var noBtn: UIButton!
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet var dropDownAnchorsViews: [UILabel]!
    var buttonsClick : OrderPageButtonsClick!
    var vehicleMakeDropDown = DropDown()
    override func awakeFromNib() {
        setupDropDowns()
        setupActions()
    }
    @IBAction func saveBtnDidTapped(_ sender: Any) {
        buttonsClick.next(index: 0)
    }
    @IBAction func yesBtnDidTapped(_ sender: UIButton) {
        activButton(btn: sender)
        inActiveBtn(btn: noBtn)
    }
    @IBAction func noBtnDidTapped(_ sender: UIButton) {
        activButton(btn: sender)
        inActiveBtn(btn: yesBtn)
    }
    
    func activButton(btn:UIButton){
        btn.backgroundColor = .systemBlue
        btn.tintColor = .white
        btn.titleLabel?.textColor = .white
    }
    func inActiveBtn(btn:UIButton)  {
        btn.backgroundColor = .white
        btn.tintColor = .systemBlue
        btn.titleLabel?.textColor = .systemBlue
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
