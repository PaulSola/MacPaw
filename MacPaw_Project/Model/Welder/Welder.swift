//
//  Welder.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/13/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class Welder {
    
    let welderName: String
    let weldingType: WelderType
    let maxCurrent: Int
    let minCurrent: Int
    
    
    init(welderName: String, weldingType: WelderType, maxCurrent:Int, minCurrent:Int ) {
        self.welderName = welderName
        self.weldingType = weldingType
        self.maxCurrent = maxCurrent
        self.minCurrent = minCurrent
    }
}

enum WelderType: String{
    case mig_mag
    case tig
    case electrode
}
