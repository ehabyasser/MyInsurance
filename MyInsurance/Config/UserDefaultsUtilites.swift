//
//  UserDefaultsUtilites.swift
//  MyInsurance
//
//  Created by ehab on 1/26/20.
//  Copyright © 2020 ehab. All rights reserved.
//

import Foundation

class UserDefaultsUtilites {
    
    class func saveString(key : String , value : String){
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func getString(key : String) -> String{
        return UserDefaults.standard.string(forKey: key) ?? ""
    }
}
