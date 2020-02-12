//
//  AlertUtilites.swift
//  MyInsurance
//
//  Created by ehab on 1/26/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import Foundation
import ProgressHUD

class AlertUtilites{
    
    class func successMessage(message : String){
        ProgressHUD.showSuccess(message , interaction : true)
    }
    
    class func errorMessage(message : String) {
        ProgressHUD.showError(message , interaction : true)
    }
    
    class func loading(message : String){
        ProgressHUD.show(message)
    }
    
    class func stopLoading(){
        ProgressHUD.dismiss()
    }
}

