//
//  Robot.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/13/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class Robot: Decodable {
    
    let robotImage: String
    let name: String
    let description: String
    
    static var hashable: HashableType<Robot> { return HashableType(self) }
    
    init( name: String, description: String, robotImage: String) {
        self.name = name
        self.description = description
        self.robotImage = robotImage
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case description
        case robotImage
        
    }
    
    required init(from decoder: Decoder) throws{
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let description = try container.decode(String.self, forKey: .description)
        let robotImage = try container.decode(String.self, forKey: .robotImage)
// ADD TYPE!!
        self.description = description
        self.name = name
        self.robotImage = robotImage
        //self.robotActionType = Robot1400(robot: robot, height: 40, width: 300, length: 20, weight: 200)
        
        
        
        //try super.init(from: decoder)
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
