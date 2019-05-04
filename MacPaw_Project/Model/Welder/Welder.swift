//
//  Welder.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/13/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class Welder: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case welderName
        case weldingType
        case maxCurrent
        case minCurrent
        
    }
    
    let welderName: String
    let weldingType: WelderType
    let maxCurrent: Int
    let minCurrent: Int
    
    required init(from decoder: Decoder) throws{
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let welderName = try container.decode(String.self, forKey: .welderName)
        let maxCurrent = try container.decode(Int.self, forKey: .maxCurrent)
        let minCurrent = try container.decode(Int.self, forKey: .minCurrent)
        let weldingType = try container.decode(String.self, forKey: .weldingType)
        
        
        self.welderName = welderName
        self.maxCurrent = maxCurrent
        self.minCurrent = minCurrent
        if let wtype = WelderType(rawValue: weldingType){
            self.weldingType = wtype
        }else {
            throw ParseError.parseError("WelderType is wrong")
        }
    }
    
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
    case spot
}
