//
//  Events.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/19/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

//struct Event1{
//    var name: String
//    var image: String
//    var info: String
//    let eventType: EventType
//}
//
//enum EventType: String {
//    case beef
//    case robots
//    case sport
//}


// enum get set , GET SET

//переделть на класс
protocol Event{
    
    var eventName: String {get set}
    var eventImage: String{get set}
}
