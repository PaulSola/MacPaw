//
//  EventService.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/19/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class EventService {
    
    func appendEvent(_ events: inout [Event]){
        
            let sportEvent = SportEvent(eventName: "I like sport", eventImage: "backgroundDay", sports: [Sports(sportName: "SKII", sportImage: "backgroundDay")])
            let beefEvent = BeefEvent(eventName: "I like BEEF", eventImage: "backgroundNight")
        
            events.append(sportEvent)
            events.append(beefEvent)
    }
}
