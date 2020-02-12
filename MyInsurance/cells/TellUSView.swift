//
//  TellUSViewController.swift
//  MyInsurance
//
//  Created by ehab on 2/3/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import UIKit
import DropDown

class TellUSView: UIView {
    @IBOutlet weak var noBtn: UIButton!
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet var dropDownAnchorsViews: [UILabel]!
    var vehicleMakeDropDown = DropDown()
    var vehicleModelDropDown = DropDown()
    var vehicleModelYearDropDown = DropDown()
    var platTypeDropDown = DropDown()
    var numberOfCylindersDropDown = DropDown()
    var bodyTypeDropDown = DropDown()
    var buttonsClick : OrderPageButtonsClick!
    override func awakeFromNib() {
       super.awakeFromNib()
       setupDropDowns()
       setupActions()
       setupDropDownDataSource()
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
}
//setup drop downs
extension TellUSView {
    func setupDropDownDataSource(){
        vehicleMakeDropDown.dataSource = [selectOption, "Alfa Romeo", "Ankai", "Aston Martin" , "Audi"  , "Austin" , "Baj" , "Bently" , "Bmx" , "Brilliance" , "Bugatti" , "Buick" , "Byd Auto" , "Cadillac" , "Cat" , "Cheverlot" , "Chrysler" , "Citreon" , "Cmc" , "Comac" , "Daewoo" , "Daihatsu" , "Datsun" , "Dodge" , "Dop" , "Doosan" , "Dynapac" , "Fargo" , "Ferrari" , "Fiat" , "Fmc" , "Ford" , "Force" , "Foton" , "Geely" , "Gmc" , "Godrej" , "Grand Tiger" , "Greatwall" , "Haima" , "Hamm" , "Hino" , "Hitachi" , "Honda" , "Howo" , "Harley Davidson" , "Hummer" , "Hyundai" , "Infiniti" , "Isuzu" , "Iveco" , "Jac" , "Jaguar" , "Jep" , "Jinbei" , "Karwa" , "Kawasaki" , "Kazuki" , "Kia" , "Kom" , "Ktm" , "Lada" , "Lancia" , "Lexus" , "Leyland" , "Liger" , "Lamborghini" , "Lincoln" , "Landrover" , "Lambardini" , "Mahindra" , "Man" , "Manitowoc" , "Maserati" , "Maxus" , "Maybach" , "Mazda" , "Mercedes" , "Mg" , "Mitsubishi" , "Mini Cooper" , "Mercury" , "Newton" , "Nissan" , "Oldsmobile" , "Omega" , "Opel" , "Panzo" , "Peterbilt" , "Peugeot" , "Pinwall" , "Pontiac" , "Porsche" , "Premah" , "Proton" , "Plymouth" , "Qtm" , "Renault" , "Rolls Royce" , "Rover" , "Saab" , "Saturn" , "Scania" , "Seat" , "Shani" , "Sino" , "Skoda" , "Samsung" , "Stc Ford" , "Stampford" , "Subaru" , "Suneard" , "Suzuki" , "Ssangyong" , "Tata" , "Tempo" , "Tho" , "Tig" , "Touche" , "Toyota" , "Trailer" , "Triumph" , "Vdl" , "Volkswagen" , "Vogele" , "Volvo" , "Weismann" , "Wirtgen" , "Yamaha" , "Zotye"]
        vehicleModelDropDown.dataSource = [selectOption]
        vehicleModelYearDropDown.dataSource = [selectOption , "2020" , "2019" , "2018" , "2017" , "2016" , "2015" , "2014" , "2013" , "2012" , "2011" , "2010" , "2009" , "2008" , "2007" , "2006" , "2005" , "2004" , "2003" ,"2002" ,"2001" ,"2000" , "1999" , "1998" , "1997" , "1996" , "1995" , "1994" , "1993" , "1992" , "1991" , "1990"]
        platTypeDropDown.dataSource = [selectOption]
        numberOfCylindersDropDown.dataSource = [selectOption]
        bodyTypeDropDown.dataSource = [selectOption]
    }
    
    func setupDropDowns(){
        vehicleMakeDropDown.anchorView = dropDownAnchorsViews[0]
        let nationGes = UITapGestureRecognizer(target: self, action: #selector(vehicleMakeDropDownClick))
        configLable(index: 0, ges: nationGes)
        vehicleModelDropDown.anchorView = dropDownAnchorsViews[1]
        let modelGes = UITapGestureRecognizer(target: self, action: #selector(vehicleModelDropDownClick))
        configLable(index: 1, ges: modelGes)
        vehicleModelYearDropDown.anchorView = dropDownAnchorsViews[2]
        let modelYearGes = UITapGestureRecognizer(target: self, action: #selector(vehicleModelYearDropDownClick))
        configLable(index: 2, ges: modelYearGes)
        platTypeDropDown.anchorView = dropDownAnchorsViews[3]
        let platTypeGes = UITapGestureRecognizer(target: self, action: #selector(platTypeDropDownClick))
        configLable(index: 3, ges: platTypeGes)
        numberOfCylindersDropDown.anchorView = dropDownAnchorsViews[4]
        let numberOfCylindersGes = UITapGestureRecognizer(target: self, action: #selector(numberOfCylinderDropDownClick))
        configLable(index: 4, ges: numberOfCylindersGes)
        bodyTypeDropDown.anchorView = dropDownAnchorsViews[5]
        let bodyTypeGes = UITapGestureRecognizer(target: self, action: #selector(bodyTypeDropDownClick))
        configLable(index: 5, ges: bodyTypeGes)
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
        vehicleModelDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.dropDownAnchorsViews[1].text = item
        }
        vehicleModelYearDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.dropDownAnchorsViews[2].text = item
        }
        platTypeDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.dropDownAnchorsViews[3].text = item
        }
        numberOfCylindersDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.dropDownAnchorsViews[4].text = item
        }
        bodyTypeDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.dropDownAnchorsViews[5].text = item
        }
    }
    
    @objc func vehicleMakeDropDownClick(){
        self.vehicleMakeDropDown.show()
    }
    @objc func vehicleModelDropDownClick(){
        self.vehicleModelDropDown.show()
    }
    @objc func vehicleModelYearDropDownClick(){
        self.vehicleModelYearDropDown.show()
    }
    @objc func platTypeDropDownClick(){
        self.platTypeDropDown.show()
    }
    @objc func numberOfCylinderDropDownClick(){
        self.numberOfCylindersDropDown.show()
    }
    @objc func bodyTypeDropDownClick(){
        self.bodyTypeDropDown.show()
    }
}
