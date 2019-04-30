//
//  Robot2400.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/13/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class Robot2400: RobotType{
  
    var robot: Robot
    
    var height: Int
    
    var width: Int
    
    var length: Int
    
    var weight: Int
    
    func move() -> String{
        
        return robot.move() + " with limits of 2400 model "
        
    }
    
    func getInfo() -> String {
        return "ABB IRB 2400 with H:\(height), W:\(width), L:\(length)"
    }
    
    init(robot: Robot, height: Int, width: Int, length: Int, weight: Int) {
        self.robot = robot
        self.height = height
        self.width = width
        self.length = length
        self.weight = weight
    }
}

