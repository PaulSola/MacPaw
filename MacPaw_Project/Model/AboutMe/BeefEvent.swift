//
//  BeefEvent.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/25/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class BeefEvent: Event{
    let deefWebsiteURL = URL(string: "http://beef.kiev.ua")
    
    let beefAppStoreURL = URL(string: "https://itunes.apple.com/us/app/beef/id1457689620?l=ru&ls=1&mt=8")
    
    var eventName: String
    
    var eventImage: String
    
    init(eventName: String, eventImage: String) {
        self.eventName = eventName
        self.eventImage = eventImage
    }
    
}
