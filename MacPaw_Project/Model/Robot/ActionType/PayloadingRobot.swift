//
//  PayloadRobot.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/13/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class PayloadingingRobot: Robot {
    
    private let payLoadLimit : Int
    
    private enum CodingKeys: String, CodingKey {
        case payLoadLimit
    }
    
    required  init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.payLoadLimit = try container.decode(Int.self, forKey: .payLoadLimit)
        
        try super.init(from: decoder)
    }
    
    init( name: String, description: String, robotImage:String, payLoadLimit: Int) {
        
        self.payLoadLimit = payLoadLimit
        
        
        super.init( name: name, description: description, robotImage: robotImage)
    }
    
    override func performAction() -> String {
        return "This robot payloads with \(payLoadLimit) weight Limit"
    }
    
    
    
}
