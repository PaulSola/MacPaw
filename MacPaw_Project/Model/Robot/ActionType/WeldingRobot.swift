//
//  WeldingRobot.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/13/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class WeldingRobot: Robot {
    
    private let welder : Welder
    
    private enum WelderKey: String, CodingKey {
        case welder
    }
    private enum WeldingKeys: String, CodingKey {
        case district
        case subDistrict
        case country
        case postalCode
    }
    
    required  init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: WelderKey.self)
        
        self.welder = try container.decode(Welder.self, forKey: .welder)
        try super.init(from: decoder)
    }
    
    init( name: String, description: String, robotImage: String, welder: Welder) {
        
        self.welder = welder
        
        
        super.init( name: name, description: description, robotImage: robotImage)
    }
    
    override func performAction() -> String {
        return "This robot welds with \(welder.welderName) \(welder.weldingType) \(welder.maxCurrent)"
    }
    
    
    
}

