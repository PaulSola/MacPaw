//
//  Robots.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 5/2/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

struct Robots: Decodable {
    
    var robots: [Robot]
    
    enum RobotsKey: CodingKey {
        case robots
    }
    enum RobotTypeKey: CodingKey {
        case type
    }
    enum RobotTypes: String, Decodable { // ??? should =
        case welding = "welding"
        case payLoad = "payLoad"
        case painting = "painting"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RobotsKey.self)
        var robotsArrayForType = try container.nestedUnkeyedContainer(forKey: RobotsKey.robots)
        var robots = [Robot]()
        
        var robotsArray = robotsArrayForType
        while(!robotsArrayForType.isAtEnd)
        {
            let robot = try robotsArrayForType.nestedContainer(keyedBy: RobotTypeKey.self)
            let type = try robot.decode(RobotTypes.self, forKey: RobotTypeKey.type)
            switch type {
            case .welding:
                print("found welding robot")
                robots.append(try robotsArray.decode(WeldingRobot.self))
            case .painting:
                print("found painting robot")
                robots.append(try robotsArray.decode(PaintingRobot.self))
            case .payLoad:
                print("found payLoad robot")
                robots.append(try robotsArray.decode(PayloadingingRobot.self))
            }
        }
        self.robots = robots
    }
}

