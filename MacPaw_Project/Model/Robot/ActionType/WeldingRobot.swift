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
    
    init(robotActionType: RobotActionType, name: String, description: String, robotImage: String, welder: Welder) {
        
        self.welder = welder
        
        
        super.init(robotActionType: robotActionType, name: name, description: description, robotImage: robotImage)
    }
    
    override func performAction() -> String {
        return "This robot welds with \(welder.welderName) \(welder.weldingType) type"
    }
    
    
    
}

