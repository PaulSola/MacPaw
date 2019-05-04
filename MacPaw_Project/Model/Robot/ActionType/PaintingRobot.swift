//
//  PaintingRobot.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/13/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class PaintingRobot: Robot {
    
    private let paintingUnit : String
    
    private enum CodingKeys: String, CodingKey {
        case paintingUnit
    }
    init( name: String, description: String, robotImage:String, paintingUnit: String) {
        
        self.paintingUnit = paintingUnit
        
        
        super.init( name: name, description: description, robotImage: robotImage)
    }
    
    required  init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.paintingUnit = try container.decode(String.self, forKey: .paintingUnit)
        try super.init(from: decoder)
    }
    
    override func performAction() -> String {
        return "This robot paints with \(paintingUnit)"
    }
    
    
    
}
