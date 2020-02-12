//
//  RegisterViewController.swift
//  MyInsurance
//
//  Created by ehab on 1/26/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import UIKit
import FirebaseDatabase

class RegisterViewController: UIViewController {

    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var IdentityNumberTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        ref = Database.database().reference()
    }
    
    @IBAction func SignUpBtnDidTapped(_ sender: Any) {
        if IdentityNumberTF.text?.isEmpty ?? true || passwordTF.text?.isEmpty ?? true || nameTF.text?.isEmpty ?? true{
            AlertUtilites.errorMessage(message: allDataRequired)
            return
        }
        checkUserExists()
    }
    
    
    func checkUserExists(){
        AlertUtilites.loading(message: loading)
        ref.child("users").queryOrdered(byChild: "identityNumber").queryEqual(toValue: IdentityNumberTF.text ?? "").observe(.value) { (snapshot) in
            AlertUtilites.stopLoading()
            if snapshot.exists(){
                AlertUtilites.errorMessage(message: identityExists)
            }else{
                self.register()
            }
        }
    }
    
    func register(){
        let uuid = UUID().uuidString
        let name = nameTF.text ?? ""
        let identityNumber = IdentityNumberTF.text ?? ""
        let password = passwordTF.text ?? ""
        let user = ["name": name,
                    "identityNumber": identityNumber,
                    "password": password]
        ref.child("users").child(uuid).setValue(user){ (error, ref) -> Void in
            AlertUtilites.stopLoading()
            if error != nil {
                AlertUtilites.errorMessage(message: error?.localizedDescription ?? "Error")
            }else{
                AlertUtilites.successMessage(message: "user Created Successfully")
                UserDefaultsUtilites.saveString(key: "uuid", value: uuid)
                self.startMainPage()
            }
        }
    }
    
    func startMainPage(){
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController")
        viewController?.modalPresentationStyle = .fullScreen
       self.present(viewController!, animated: true, completion: nil)
    }
}
