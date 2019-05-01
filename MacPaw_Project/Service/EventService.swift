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
        
        let sportEvent = SportEvent(eventName: "I like sport", eventImage: "backgroundDay", sports: [Sports(sportName: "⛷SKII🎿", sportDescription: "Skiing can be a means of transport, a recreational activity or a competitive winter sport in which the participant uses skis to glide on snow. Many types of competitive skiing events are recognized by the International Olympic Committee, and the International Ski Federation.", sportImage: "backgroundDay"),Sports(sportName: "SKII", sportDescription: "Some", sportImage: "backgroundDay"),Sports(sportName: "SKII", sportDescription: "Some", sportImage: "backgroundDay")])
            let beefEvent = BeefEvent(eventName: "I like BEEF", eventImage: "backgroundNight")
        
            events.append(sportEvent)
            events.append(beefEvent)
    }
}
