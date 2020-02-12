//
//  CheckIdentityExistsViewController.swift
//  MyInsurance
//
//  Created by ehab on 1/26/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CheckIdentityExistsViewController: UIViewController {

    @IBOutlet weak var identityNumberTF: UITextField!
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        ref = Database.database().reference()
    }
    @IBAction func sendBtnDidTapped(_ sender: Any) {
        if identityNumberTF.text?.isEmpty ?? true {
            AlertUtilites.errorMessage(message: allDataRequired)
            return
        }
        checkUserExists()
    }
    
    func checkUserExists(){
        AlertUtilites.loading(message: loading)
        ref.child("users").queryOrdered(byChild: "identityNumber").queryEqual(toValue: identityNumberTF.text ?? "").observe(.value) { (snapshot) in
            AlertUtilites.stopLoading()
            if !snapshot.exists(){
                AlertUtilites.errorMessage(message: identityExists)
            }else{
                print("count \(snapshot.childrenCount)")
                for snap in snapshot.children {
                    let key = (snap as! DataSnapshot).key
                    print("key \(key)")
                    self.openForgetPasswordPage(uuid: key)
                    break
                }
            }
        }
    }
    
    func openForgetPasswordPage(uuid : String){
        let vc = (storyboard?.instantiateViewController(withIdentifier: "ForgetPasswordViewController")) as! ForgetPasswordViewController
        vc.uuid = uuid
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
