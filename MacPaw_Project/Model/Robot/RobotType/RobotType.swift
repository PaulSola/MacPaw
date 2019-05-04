//
//  RobotType.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/13/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class RobotType: Decodable{
    
    enum RobotActionTypes: String, Decodable { // ??? should =
        case welding = "welding"
        case payLoad = "payLoad"
        case painting = "painting"
    }

    
    //var robotType: TypeOfRobot {get set}
    var robot: Robot
    var height: Int
    var width: Int
    var length: Int 
    var weight: Int
    func move() -> String{
        return robot.move()
    }
    func getInfo() ->String{
        return "ABB IRB " + getName() + " with size: " + getSize()
    }
    private func getSize() -> String{
        return "H:\(height), W:\(width), L:\(length)"
    }
    func getName() -> String{return "name"}
    
    private enum CodingKeys: CodingKey {
        case robot
        case height
        case width
        case length
        case weight
        
    }
    
    enum RobotsKey: CodingKey {
        case robots
    }
    enum RobotTypeKey: CodingKey {
        case type
    }
    
    required init(from decoder: Decoder) throws{
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let height = try container.decode(Int.self, forKey: .height)
        let width = try container.decode(Int.self, forKey: .width)
        let length = try container.decode(Int.self, forKey: .length)
        let weight = try container.decode(Int.self, forKey: .weight)
        //let robot = try container.decode(WeldingRobot.self, forKey: .robot)
        
        let robot = try container.nestedContainer(keyedBy: RobotTypeKey.self, forKey: .robot)
        let type = try robot.decode(RobotActionTypes.self, forKey: .type)
        
        switch type {
        case .welding:
            print("found welding robot")
            self.robot = try container.decode(WeldingRobot.self, forKey: .robot)
        case .painting:
            print("found painting robot")
            self.robot = try container.decode(PaintingRobot.self, forKey: .robot)
        case .payLoad:
            print("found payLoad robot")
            self.robot = try container.decode(PayloadingingRobot.self, forKey: .robot)
        }
        
        //let robot1 = try container.decode([String, Any].self, forKey: .robot)
        
        self.height = height
        self.width = width
        self.length = length
        self.weight = weight
        
        
        
        //try super.init(from: decoder)
    }
    
    init(robot: Robot, height: Int, width: Int, length: Int,weight: Int) {
        self.robot = robot
        self.height = height
        self.width = width
        self.length = length
        self.weight = weight
        
    }
}



//enum TypeOfRobot : String{
//    
//    case small
//    case medium
//    case big
//
//}


