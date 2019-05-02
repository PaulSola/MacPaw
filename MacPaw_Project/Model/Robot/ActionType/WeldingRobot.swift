//
//  WeldingRobot.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/13/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class WeldingRobot: Robot {
    
    let welder : Welder
    
    enum WelderKey: String, CodingKey {
        case welder
    }
    enum WeldingKeys: String, CodingKey {
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
    
    init(robotActionType: RobotActionType, name: String, description: String, robotImage: String, welder: Welder) {
        
        self.welder = welder
        
        
        super.init(robotActionType: robotActionType, name: name, description: description, robotImage: robotImage)
    }
    
    override func performAction() -> String {
        return "This robot welds with \(welder.welderName) \(welder.weldingType) type"
    }
    
    
    
}

