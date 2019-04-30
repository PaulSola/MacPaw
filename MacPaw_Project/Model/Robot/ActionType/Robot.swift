//
//  Robot.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/13/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class Robot {
    
    //let rovbotType: RobotType
    let robotActionType: RobotActionType
    let robotImage: String
    let name: String
    let description: String
    
    init(robotActionType: RobotActionType, name: String, description: String, robotImage: String) {
        self.robotActionType = robotActionType
        self.name = name
        self.description = description
        self.robotImage = robotImage
    }
    
    func move() -> String{
        return "Robot moves from X to Y"
    }
    
    func performAction() -> String{
        return "Unknown action"
    }
}

enum RobotActionType : String{
    
    case welding
    case payLoad
    case painting
}
