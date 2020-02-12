//
//  LoginViewController.swift
//  MyInsurance
//
//  Created by ehab on 1/25/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import UIKit
import FirebaseDatabase

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var identityNumberTF: UITextField!
    var ref: DatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        ref = Database.database().reference()
    }
    func changeLang()  {
        var transition: UIView.AnimationOptions = .transitionFlipFromLeft
        if L102Language.currentAppleLanguage() == "en" {
            L102Language.setAppleLAnguageTo(lang: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            L102Language.setAppleLAnguageTo(lang: "en")
            transition = .transitionFlipFromRight
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        AppDelegate.sharedInstance().window?.rootViewController = controller
        let mainwindow = (UIApplication.shared.delegate?.window!)!
        mainwindow.backgroundColor = UIColor(hue: 0.6477, saturation: 0.6314, brightness: 0.6077, alpha: 0.8)
        UIView.transition(with: mainwindow, duration: 0.55001, options: transition, animations: { () -> Void in
        }) { (finished) -> Void in
            self.dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func languageBtnDidTapped(_ sender: Any) {
        changeLang()
    }
    @IBAction func loginBtnDidTapped(_ sender: Any) {
        if identityNumberTF.text?.isEmpty ?? true || passwordTF.text?.isEmpty ?? true{
            AlertUtilites.errorMessage(message: allDataRequired)
            return
        }
        login(identityNumber: identityNumberTF.text ?? "", password: passwordTF.text ?? "")
    }
    
    func login(identityNumber : String , password : String){
        AlertUtilites.loading(message: loading)
        ref.child("users").queryOrdered(byChild: "identityNumber").queryEqual(toValue: identityNumberTF.text).observe(.value) { (snapshot) in
            AlertUtilites.stopLoading()
            if snapshot.exists(){
                for snap in snapshot.children {
                    let key = (snap as! DataSnapshot).key
                    UserDefaultsUtilites.saveString(key: "uuid", value: key)
                    self.startMainPage()
                    print(key)
                    print("values \((snap as! DataSnapshot).value ?? "dev")")
                }
            }else{
                AlertUtilites.errorMessage(message: wrongIdentity)
            }
        }
    }
    func startMainPage(){
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController")
        viewController?.modalPresentationStyle = .fullScreen
        self.present(viewController!, animated: true, completion: nil)
    }
    @IBAction func visitorBtnDidTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController")
        vc?.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true, completion: nil)
    }
}
