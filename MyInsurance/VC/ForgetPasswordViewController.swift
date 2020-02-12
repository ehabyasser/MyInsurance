//
//  ForgetPasswordViewController.swift
//  MyInsurance
//
//  Created by ehab on 1/26/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var confrimNewPasswordTF: UITextField!
    @IBOutlet weak var newPasswordTF: UITextField!
    var ref: DatabaseReference!
    var uuid : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("uuid \(uuid!)")
        hideKeyboardWhenTappedAround()
        ref = Database.database().reference()
    }
    
    
    @IBAction func updateBtnDidTapped(_ sender: Any) {
        if newPasswordTF.text?.isEmpty ?? true || confrimNewPasswordTF.text?.isEmpty ?? true {
             AlertUtilites.errorMessage(message: allDataRequired)
            return
        }
        if newPasswordTF.text != confrimNewPasswordTF.text{
            AlertUtilites.errorMessage(message: passwordsNotMatch)
            return
        }
        update()
    }
    
    
    func update(){
        AlertUtilites.loading(message: loading)
        ref.child("users").child(uuid!).child("password").setValue(newPasswordTF.text){
            (error , ref) -> Void in
            AlertUtilites.stopLoading()
            if error != nil {
                AlertUtilites.errorMessage(message: error?.localizedDescription ?? "error")
            }else{
                AlertUtilites.successMessage(message: updatePasswordSuccess)
            }
        }
    }
    
}
