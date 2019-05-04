//
//  RobotService.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/14/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class RobotService {
    
//    let height = try container.decode(Int.self, forKey: .height)
//    let width = try container.decode(Int.self, forKey: .width)
//    let length = try container.decode(Int.self, forKey: .length)
//    let weight = try container.decode(Int.self, forKey: .weight)
//    //let robot = try container.decode(WeldingRobot.self, forKey: .robot)
//
//    let robot = try container.nestedContainer(keyedBy: RobotTypeKey.self, forKey: .robot)
    
    let jsonRobots = """

{
"robots": [
{
"type": "1400",
"height": 100,
"width": 50,
"length": 50,
"weight": 150,
"robot":
{
"type": "welding",
"name":"Jack",
"description":"ABB - 1 x IRB1400 M2000 six axis robot with S4CPlus controller, 1,5 m arm reach and 5 kg payload, 1 x Fronius Robacta TC 1000 automatic torch cleaning station and  1 x safety light barriers system and external operation panel",
"robotImage":"Jack",
"welder":
{
  "weldingType":"tig",
  "welderName": "Fronius",
  "maxCurrent": 400,
  "minCurrent": 20
}
}
},
{
"type": "1400",
"height": 120,
"width": 40,
"length": 40,
"weight": 100,
"robot":
{
"type": "welding",
"name":"Albert",
"description":"Our last robot! We bought it this year. M97 system (BaseWare 3.0)-> upgraded to M98A (BaseWare 3.2). Integrated Elmatech MIG welding power source,  400A power, suitable for aluminium welding (Double Pulse)",
"robotImage":"Albert",
"welder":
{
  "weldingType":"mig_mag",
  "welderName": "Elmatech",
  "maxCurrent": 300,
  "minCurrent": 20
}
}
},
{
"type": "6400",
"height": 200,
"width": 80,
"length": 80,
"weight": 400,
"robot":
{
"type": "welding",
"name":"Buldog",
"description":"ABB IRB IRC5 6400 with FlexGun (is a linear spot welding gun). It has a modular design consisting of one standard gun body with various X and J/C gun arm types.",
"robotImage":"Buldog",
"welder":
{
  "weldingType":"spot",
  "welderName": "ESAB",
  "maxCurrent": 300,
  "minCurrent": 20
}
}
},
{
"type": "2400",
"height": 130,
"width": 50,
"length": 50,
"weight": 200,
"robot":
{
"type": "welding",
"name":"Leonid",
"description":"Our first robot! My father bought it in 2017. M98A system (BaseWare 3.2) SC4 controller.  Integrated Arcitec ESAB welding power source,  400A power, suitable for carbon steel welding",
"robotImage":"Leonid",
"welder":
{
  "weldingType":"mig_mag",
  "welderName": "ESAB",
  "maxCurrent": 400,
  "minCurrent": 20
}
}
},
{
"type": "2400",
"height": 100,
"width": 60,
"length": 60,
"weight": 240,
"robot":
{
"type": "painting",
"name":"Salvador",
"description":"Salvador Domingo Felipe Jacinto Dalí i Domènech, 1st Marquis of Dalí de Púbol, known professionally as Salvador Dalí, was a prominent Spanish surrealist born in Figueres, Catalonia, Spain. Dalí was a skilled draftsman, best known for the striking and bizarre images in his surrealist work. His painterly skills are often attributed to the influence of Renaissance masters",
"robotImage":"Salvador",
"paintingUnit":"Kistochka"
}
},
{
"type": "1400",
"height": 80,
"width": 50,
"length": 50,
"weight": 150,
"robot":
{
"type": "painting",
"name":"Picasso",
"description":"Pablo Ruiz Picasso was a Spanish painter, sculptor, printmaker, ceramicist, stage designer, poet and playwright who spent most of his adult life in France. Regarded as one of the most influential artists of the 20th century, he is known for co-founding the Cubist movement, the invention of constructed sculpture, the co-invention of collage, and for the wide variety of styles that he helped develop and explore.",
"robotImage":"Picasso",
"paintingUnit":"Kistochka"
}
},
{
 "type": "6400",
"height": 4,
"width": 4,
"length": 4,
"weight": 4,
"robot":
{
"type": "payLoad",
"name":"Schumacher",
"description":"The newly-branded Formula E car is unveiled by an ABB IRB robot at Autosport International Show - January 11th, 2018. IRB 6400 S4C series can handle spot welding, press tending, material handling, machine tending, palletizing, and assembly with different arm variants and payload capacities.",
"robotImage":"Schumacher",
"payLoadLimit": 200
}
}
]
}
""".data(using: .utf8)!
    
    func addRobots(completion: @escaping (_ robots: [RobotWithAction]?,_ error: String?)->()){
        
        var robots : [RobotType]?
        
        do{
        let apiResponse = try JSONDecoder().decode(Robots.self, from: jsonRobots)// responceData
            robots = apiResponse.robots
        }
        catch{
            print(error)
        }
        if(robots != nil){
            
            completion(devideIntoMap(robots!),nil)
        }
        else{
            completion(nil,"Error")
        }
        
       
        
        
        
    }
    
    func devideIntoMap (_ robots: [RobotType]) -> [RobotWithAction]{
        var robMap: [HashableType<Robot>: [RobotType]] = [:]
        var robotStruct = [RobotWithAction]()
        
        for robot in robots {
            
            let robotType = robot.getRobot()
            
            let actionType = type(of: robotType).hashable
            
            if(!robMap.keys.contains(actionType))
            {
                
                robMap[actionType] = [RobotType]()
                
            }
            robMap[actionType]!.append(robot)
        }
        
        for robotActionType in robMap{
            
            var type : String
            
            switch robotActionType.key {
            case WeldingRobot.hashable :
                type = "Welding"
            case PaintingRobot.hashable :
                type = "Painting"
            case PayloadingingRobot.hashable :
                type = "Payloading"
            default:
                type = "none"
            }
            robotStruct.append(RobotWithAction(robotType:type, robots: robotActionType.value))
        }
        return robotStruct
        
        //print(robMap)
    }
    
}
