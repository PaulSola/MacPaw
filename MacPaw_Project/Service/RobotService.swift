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
"height": 4,
"width": 4,
"length": 4,
"weight": 4,
"robot":
{
"type": "welding",
"name":"Albert",
"description":"Some1",
"robotImage":"welding1400",
"welder":
{
  "weldingType":"tig",
  "welderName": "Fronius",
  "maxCurrent": 300,
  "minCurrent": 20
}
}
},
{
"type": "2400",
"height": 4,
"width": 4,
"length": 4,
"weight": 4,
"robot":
{
"type": "painting",
"name":"Name1",
"description":"Some1",
"robotImage":"welding1400",
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
"name":"Name1",
"description":"Some1",
"robotImage":"welding1400",
"payLoadLimit":300
}
}
]
}
""".data(using: .utf8)!
    
    func addRobots(completion: @escaping (_ robots: [RobotWithAction]?,_ error: String?)->()){
        
        var robots = [RobotType]() //?
        
        var robot : Robot!
        
        
        let welder = Welder(welderName: "Fronius", weldingType: .mig_mag, maxCurrent: 400, minCurrent: 40)
        robot = WeldingRobot( name: "Albert", description: "Given such a broad base of experience to work with, AWL’s welding cells are built upon proven technology—ensuring a high degree of uptime and reliability. While the company’s core market is supplying automated welding solutions to the automotive industry, they are also well known for advances in the construction, storage and packaging industries. AWL’s success can be tied directly to the fact that their unique automated solutions provide the flexibility and versatility that modern welding customers demand. 🚙", robotImage: "welding1400", welder: welder)
        let robotType1 = Robot1400(robot: robot, height: 40, width: 300, length: 20, weight: 200)
        robot = PaintingRobot( name: "Jack", description: "SomeInfo", robotImage: "welding1400", paintingUnit: "DX140")
         let robotType2 = Robot2400(robot: robot, height: 40, width: 300, length: 20, weight: 200)
        
        
        robot = PayloadingingRobot( name: "Leonid", description: "SomeInfo", robotImage: "welding1400", payLoadLimit: 400)
        let robotType3 = Robot6400(robot: robot, height: 40, width: 300, length: 20, weight: 400)
        
        robot = PaintingRobot( name: "Vasya", description: "SomeInfo", robotImage: "welding1400", paintingUnit: "DX140")
        let robotType4 = Robot2400(robot: robot, height: 40, width: 300, length: 20, weight: 200)
        
        robots.append(robotType1)
        robots.append(robotType2)
        robots.append(robotType3)
        robots.append(robotType4)
        
       // let robMap = [WeldingRobot.self : [Robot]]
        
        
        
        do{
        let apiResponse = try JSONDecoder().decode(Robots.self, from: jsonRobots)// responceData
            robots = apiResponse.robots
        }
        catch{
            print(error)
        }
        if(robots != nil){
            
            completion(devideIntoMap(robots),nil)
        }
        else{
            completion(nil,"Error")
        }
        
       
        
        
        
    }
    
    func devideIntoMap (_ robots: [RobotType]) -> [RobotWithAction]{
        var robMap: [HashableType<Robot>: [RobotType]] = [:]
        var robotStruct = [RobotWithAction]()
        
        for robot in robots {
            
            let robotType = robot.robot
            
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
