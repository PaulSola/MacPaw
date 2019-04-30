//
//  SportEvent.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/25/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation


struct Sports {
    
    var sportName: String
    var sportImage: String
}


class SportEvent: Event {
    
    var sports: [Sports]
    
    var eventName: String
    
    var eventImage: String
    
    init(eventName: String, eventImage: String, sports: [Sports]) {
        self.eventName = eventName
        self.eventImage = eventImage
        self.sports = sports
    }
    
    
}
