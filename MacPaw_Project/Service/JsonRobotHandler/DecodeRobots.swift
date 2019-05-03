//
//  Robots.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 5/2/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

struct Robots: Decodable {
    
    var robots: [RobotType]
    
    enum RobotsKey: CodingKey {
        case robots
    }
    enum RobotTypeKey: CodingKey {
        case type
    }
    enum RobotTypes: String, Decodable { // ??? should =
        case small = "1400"
        case medium = "2400"
        case large = "6400"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RobotsKey.self)
        var robotsArrayForType = try container.nestedUnkeyedContainer(forKey: RobotsKey.robots)
        var robots = [RobotType]()
        
        var robotsArray = robotsArrayForType
        while(!robotsArrayForType.isAtEnd)
        {
            let robot = try robotsArrayForType.nestedContainer(keyedBy: RobotTypeKey.self)
            let type = try robot.decode(RobotTypes.self, forKey: RobotTypeKey.type)
            switch type {
            case .small:
                print("found welding robot")
                robots.append(try robotsArray.decode(Robot1400.self))
            case .medium:
                print("found painting robot")
                robots.append(try robotsArray.decode(Robot2400.self))
            case .large:
                print("found payLoad robot")
                robots.append(try robotsArray.decode(Robot6400.self))
            }
        }
        self.robots = robots
    }
}

