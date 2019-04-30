//
//  PaintingRobot.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/13/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class PaintingRobot: Robot {
    
    let paintingUnit : String
    
    init(robotActionType: RobotActionType, name: String, description: String, robotImage:String, paintingUnit: String) {
        
        self.paintingUnit = paintingUnit
        
        
        super.init(robotActionType: robotActionType, name: name, description: description, robotImage: robotImage)
    }
    
    override func performAction() -> String {
        return "This paints with \(paintingUnit)"
    }
    
    
    
}
