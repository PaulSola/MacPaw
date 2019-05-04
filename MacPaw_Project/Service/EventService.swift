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
        
        let sportEvent = SportEvent(eventName: "Sports", eventImage: "sports", sports: [Sports(sportName: "⛷ SKIING 🎿", sportDescription: " 1. Anticipation, there is nothing as exciting as getting ready for a big day on the slopes. You prep your gear, spill coffee on yourself during the commute to the slopes, put balance on one foot putting on your ski boots in the cold snowy parking lot, then you lug your heavy ski gear to the lifts. Are we having fun yet? Answer, yes.\n\n 2. That first run, the snow sparkles like diamond dust, and the corduroy ripples perfectly, welcoming your signature turns. Aren’t you glad you got out of bed now? Even when the skiing isn’t great ( icy, slushy, frigid, howling wind), it still beats working. \n\n 3. Mountaintops in winter are absolutely magical. Trees resemble snow ghosts draped in heavy frost, and the valleys and hillside below are framed in panoramic photo.", sportImage: "skiing"),Sports(sportName: "🏎 RACING 🏎", sportDescription: "I’ve never known something that gives me such an adrenaline rush. The moment at the start of the Grand Prix, the bit at the end of the parade lap when the grid takes shape, the camera pans across in front of grid as five little lights pop up above the anxious drivers and the F1 symphony begins when the cars all rev their engines in unison. That very moment – you know it too – just makes my heart stop dead. There’s a race coming, and in the words of Murray Walker “Anything can happen in Formula One … And it usually does!”. ", sportImage: "f1Img"),Sports(sportName: "🚵🏻‍♀️ BIKING 🚵‍♂️", sportDescription: "I truly believe that mountain biking is one of the best ways to connect with nature and escape the city.   It's becoming increasingly difficult to disconnect from  technology and live in the moment - both of which become much easier if you're pedalling through forested singletrack, navigating roots and rocks and focusing on the trail ahead. \n\n. I like exploring new routes and places. On training rides I'm usually using the same route, because it's easier to track progress, but I have at least 1 exploration ride each week. I like that I don't know what lays behind next hill and next turn.\n\n I like the sense of speed and sense of freedom.", sportImage: "biking")])
        let beefEvent = BeefEvent(eventName: "BEEF", eventImage: "BEEF", beefDescr: "BEEF meat & wine – Мясной, Мужской, Международный ресторан. \n\nОткрыт в 2010 году, ресторан дважды удостоился премии «Лучший мясной ресторан Украины». Основной продукт ресторана — мясо. Его готовят на четырехметровом открытом гриле Parrilla и в дровяной печи. \n\nДля стейков BEEF использует мраморное мясо органической фермы Creekstone Farms (Kansas, USA). \n\nЕжедневно ресторан открывается в 9:00 и работает до последнего гостя, сервирует свои знаменитые стейки и сопровождает их винами из обширной энотеки \n\nВ прошлом году мы предложили ресторану BEEF мобильное приложение на Ios/Android платформах. И в ближайшее время планируется старт!")
        
            events.append(sportEvent)
            events.append(beefEvent)
    }
}
