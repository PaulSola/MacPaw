//
//  Robot1400.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/13/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class Robot1400: RobotType{
   override func getInfo() -> String {
        return "ABB IRB 1400 with H:\(height), W:\(width), L:\(length)"
    }
    
//    class A{
//
//    print() {
//        return printRopotName() + printRopotType() + prtintSize()
//    }
//    printRopotName()
//        printRobotName()
//        printRopotType(){ABB IRB}
//        prtintSize()
//    }
//
//
//    class ConcreteA : A {
//        override printRobotName()
//        override printSize()
//    }
//
//
//    A : ConcreteA
//
//    A.print()

    
    override func move() -> String{
        
     return robot.move() + " with limits of 1400 model "
        
    }
    
    override init(robot: Robot, height: Int, width: Int, length: Int, weight: Int) {
        super.init(robot: robot, height: height, width: width, length: length, weight: weight)
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}
