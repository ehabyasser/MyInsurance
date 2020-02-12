//
//  SplashViewController.swift
//  MyInsurance
//
//  Created by ehab on 1/25/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            //if UserDefaultsUtilites.getString(key: "uuid").isEmpty{
                self.startLoginPage()
//            }else{
//                self.startMainPage()
//            }
        }
    }
    
    func startLoginPage(){
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")
        viewController?.modalPresentationStyle = .fullScreen
        self.dismiss(animated: true) {
            self.present(viewController!, animated: true, completion: nil)
        }
    }
    
    func startMainPage(){
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController")
        viewController?.modalPresentationStyle = .fullScreen
        self.dismiss(animated: true) {
            self.present(viewController!, animated: true, completion: nil)
        }
    }
}
