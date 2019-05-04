//
//  Robot.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/13/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class Robot: Decodable {
    static var hashable: HashableType<Robot> { return HashableType(self) }
    
    private let robotImage: String
    private let name: String
    private let description: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case description
        case robotImage
        
    }
    
    init( name: String, description: String, robotImage: String) {
        self.name = name
        self.description = description
        self.robotImage = robotImage
    }
    
    func getName() -> String{return name}
    func getRobotImage() -> String{return robotImage}
    func getDescription() -> String{return description}
    
    
    required init(from decoder: Decoder) throws{
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let description = try container.decode(String.self, forKey: .description)
        let robotImage = try container.decode(String.self, forKey: .robotImage)
        self.description = description
        self.name = name
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
