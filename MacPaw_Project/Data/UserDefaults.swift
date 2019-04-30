//
//  File.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/16/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class MyData {

    
//    var isNightMode: Bool = {
//        let mode = UserDefaults.standard.bool(forKey: "mode")
//        return mode
//    }()
    
    func saveMode(_ mode: Bool){
        UserDefaults.standard.set(mode, forKey: "mode")
    }
    
    func getMode() -> Bool{
        if(isKeyPresentInUserDefaults(key: "mode")){
            return UserDefaults.standard.bool(forKey: "mode")
        }
        else{
            self.saveMode(false)
            return false
        }
        
    }
    
    func isKeyPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
}
