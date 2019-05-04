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
    //test commit
    let beefAppStoreURL = URL(string: "https://itunes.apple.com/ua/app/beef/id1457689620?l=ru&mt=8")
    
    var eventName: String
    
    var eventImage: String
    
    var beefDescr : String
    
    init(eventName: String, eventImage: String, beefDescr: String) {
        self.eventName = eventName
        self.eventImage = eventImage
        self.beefDescr = beefDescr
    }
    
}
