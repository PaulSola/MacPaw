//
//  Robot6400.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/13/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class Robot6400: RobotType{
    
    override func move() -> String{
        
        return robot.move() + " with limits of 6400 model "
        
    }
    
    override func getInfo() -> String {
        return "ABB IRB 6400 with H:\(height), W:\(width), L:\(length)"
    }
    
    override init(robot: Robot, height: Int, width: Int, length: Int, weight: Int) {
        super.init(robot: robot, height: height, width: width, length: length, weight: weight)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}
