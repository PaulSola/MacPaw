//
//  RobotType.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/13/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

protocol RobotType {
    
    //var robotType: TypeOfRobot {get set}
    var robot: Robot {get set}
    var height: Int {get set}
    var width: Int {get set}
    var length: Int {get set}
    var weight: Int {get set}
    func move() -> String
    func getInfo() ->String
}



//enum TypeOfRobot : String{
//    
//    case small
//    case medium
//    case big
//
//}


