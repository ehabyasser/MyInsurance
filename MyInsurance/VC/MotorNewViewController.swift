//
//  MotorNewViewController.swift
//  MyInsurance
//
//  Created by ehab on 2/3/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import UIKit
import DropDown

class MotorNewViewController: UIViewController{
    var index : Int = 0
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var additionalBtn: UIButton!
    @IBOutlet weak var planBtn: UIButton!
    @IBOutlet weak var tellBtn: UIButton!
    @IBOutlet weak var headViewSteps: UIView!
    var tellUsView : TellUSView = TellUSView()
    var thePlantView : ThePlantView = ThePlantView()
    var additionalDetailsView : AdditionalDetails = AdditionalDetails()
    var submitView : SubmitView = SubmitView()
    var travelPlanView : TravelPlanView = TravelPlanView()
    var surplusView : SurplusView = SurplusView()
    var homeInsuranceView : HomeInsuranceView = HomeInsuranceView()
    var boatInsuranceView : BoatInsuranceView = BoatInsuranceView()
    var motorRenewView : MotorRenewView = MotorRenewView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setMainPage(index: index)
    }
    
    func setMainPage(index:Int){
        switch index {
        case 0:
            setMotorRenewView()
            break
        case 1:
            setHomeView()
            
            break
        case 2:
            
            setTellUsView()
            break
        case 3:
            setTravelPlanView()
            break
        case 4:
            setBoatView()
            
            break
        case 5:
            
            setTellUsView()
            break
        case 6:
            
           setMotorRenewView()
            break
        case 7:
            setSurplusView()
            break
        default:
            break
        }
    }
    
}

extension MotorNewViewController{
    func removeViews(){
        additionalDetailsView.removeFromSuperview()
        thePlantView.removeFromSuperview()
        tellUsView.removeFromSuperview()
    }
    func desSelectBtns(){
        tellBtn.isSelected = false
        planBtn.isSelected = false
        additionalBtn.isSelected = false
        submitBtn.isSelected = false
    }
    func setTellUsView(){
        removeViews()
        desSelectBtns()
        tellBtn.isSelected = true
        tellUsView = UIView.fromNib(name:"OrderView" , index:0)
        tellUsView.buttonsClick = self
        tellUsView.frame = CGRect(x: self.view.frame.origin.x, y: self.headViewSteps.frame.height, width: self.view.frame.width, height: self.view.frame.height-70)
        self.view.addSubview(tellUsView)
    }
    
    func setThePlantView(){
        removeViews()
        desSelectBtns()
        planBtn.isSelected = true
        thePlantView = UIView.fromNib(name:"OrderView" , index:1)
        thePlantView.buttonsClick = self
        thePlantView.frame = CGRect(x: self.view.frame.origin.x, y: self.headViewSteps.frame.height, width: self.view.frame.width, height: self.view.frame.height-70)
        self.view.addSubview(thePlantView)
    }
    
    func setAdditionalDetailsView(){
        removeViews()
        desSelectBtns()
        additionalBtn.isSelected = true
        additionalDetailsView = UIView.fromNib(name:"OrderView" , index:2)
        additionalDetailsView.buttonsClick = self
        additionalDetailsView.frame = CGRect(x: self.view.frame.origin.x, y: self.headViewSteps.frame.height, width: self.view.frame.width, height: self.view.frame.height-70)
        self.view.addSubview(additionalDetailsView)
    }
    func setSubmitView(){
        removeViews()
        desSelectBtns()
        submitBtn.isSelected = true
        submitView = UIView.fromNib(name:"OrderView" , index:3)
        submitView.buttonsClick = self
        submitView.frame = CGRect(x: self.view.frame.origin.x, y: self.headViewSteps.frame.height, width: self.view.frame.width, height: self.view.frame.height-70)
        self.view.addSubview(submitView)
    }
    
    func setTravelPlanView(){
        removeViews()
        desSelectBtns()
        tellBtn.isSelected = true
        travelPlanView = UIView.fromNib(name:"OrderView" , index:4)
        travelPlanView.buttonsClick = self
        travelPlanView.frame = CGRect(x: self.view.frame.origin.x, y: self.headViewSteps.frame.height,
                                      width: self.view.frame.width, height: self.view.frame.height-35)
        self.view.addSubview(travelPlanView)
    }
    
    func setSurplusView(){
        removeViews()
        desSelectBtns()
        tellBtn.isSelected = true
        surplusView = UIView.fromNib(name:"OrderView" , index:5)
        surplusView.buttonsClick = self
        surplusView.frame = CGRect(x: self.view.frame.origin.x, y: self.headViewSteps.frame.height,
                                      width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(surplusView)
    }
    
    func setHomeView(){
        removeViews()
        desSelectBtns()
        tellBtn.isSelected = true
        homeInsuranceView = UIView.fromNib(name:"OrderView" , index:6)
        homeInsuranceView.buttonsClick = self
        homeInsuranceView.frame = CGRect(x: self.view.frame.origin.x, y: self.headViewSteps.frame.height,
                                      width: self.view.frame.width, height: self.view.frame.height-70)
        self.view.addSubview(homeInsuranceView)
    }
    
    func setBoatView(){
        removeViews()
        desSelectBtns()
        tellBtn.isSelected = true
        boatInsuranceView = UIView.fromNib(name:"OrderView" , index:7)
        boatInsuranceView.buttonsClick = self
        boatInsuranceView.frame = CGRect(x: self.view.frame.origin.x, y: self.headViewSteps.frame.height,
                                      width: self.view.frame.width, height: self.view.frame.height-35)
        self.view.addSubview(boatInsuranceView)
    }
    
    func setMotorRenewView(){
        removeViews()
        desSelectBtns()
        tellBtn.isSelected = true
        motorRenewView = UIView.fromNib(name:"OrderView" , index:8)
        motorRenewView.buttonsClick = self
        motorRenewView.frame = CGRect(x: self.view.frame.origin.x, y: self.headViewSteps.frame.height,
                                      width: self.view.frame.width, height: self.view.frame.height-70)
        self.view.addSubview(motorRenewView)
    }
}

extension MotorNewViewController : OrderPageButtonsClick{
    func next(index: Int) {
        switch index {
        case 0:
            setThePlantView()
            break
        case 1:
            setAdditionalDetailsView()
            break
        case 2:
            setSubmitView()
            break
        case 3:
            showAlert()
            break
        default:
            break
        }
    }
    
    func back(index: Int) {
        switch index {
        case 1:
            setMainPage(index: self.index)
            break
        case 2:
            setThePlantView()
            break
        case 3:
            setAdditionalDetailsView()
            break
        default:
            break
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Info", message: "Saved", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
