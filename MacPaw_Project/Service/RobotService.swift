//
//  RobotService.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/14/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation

class RobotService {
    
    func addRobots(completion: @escaping (_ robots: [RobotWithAction]?,_ error: String?)->()){
        
        var robots = [RobotType]() //?
        
        var robot : Robot!
        
        
        let welder = Welder(welderName: "Fronius", weldingType: .mig_mag, maxCurrent: 400, minCurrent: 40)
        robot = WeldingRobot(robotActionType: .welding, name: "Albert", description: "Given such a broad base of experience to work with, AWL’s welding cells are built upon proven technology—ensuring a high degree of uptime and reliability. While the company’s core market is supplying automated welding solutions to the automotive industry, they are also well known for advances in the construction, storage and packaging industries. AWL’s success can be tied directly to the fact that their unique automated solutions provide the flexibility and versatility that modern welding customers demand. 🚙", robotImage: "welding1400", welder: welder)
        let robotType1 = Robot1400(robot: robot, height: 40, width: 300, length: 20, weight: 200)
        robot = PaintingRobot(robotActionType: .painting, name: "Jack", description: "SomeInfo", robotImage: "welding1400", paintingUnit: "DX140")
         let robotType2 = Robot2400(robot: robot, height: 40, width: 300, length: 20, weight: 200)
        
        
        robot = PayloadingingRobot(robotActionType: .payLoad, name: "Leonid", description: "SomeInfo", robotImage: "welding1400", payLoadLimit: 400)
        let robotType3 = Robot6400(robot: robot, height: 40, width: 300, length: 20, weight: 400)
        
        robot = PaintingRobot(robotActionType: .painting, name: "Vasya", description: "SomeInfo", robotImage: "welding1400", paintingUnit: "DX140")
        let robotType4 = Robot2400(robot: robot, height: 40, width: 300, length: 20, weight: 200)
        
        robots.append(robotType1)
        robots.append(robotType2)
        robots.append(robotType3)
        robots.append(robotType4)
        
        if(robots != nil){
            
            completion(devideIntoGroups(robots),nil)
        }
        else{
            completion(nil,"Error")
        }
        
       
        
        
        
    }
    
    func devideIntoGroups(_ robots: [RobotType] ) -> [RobotWithAction]{ // переделать под сразу структуру
        
        var robotDict = Dictionary<String,[RobotType]>()
        var robotStruct = [RobotWithAction]()
        
        for robot in robots {
            let robotActionType = robot.robot.robotActionType
            if(!robotDict.keys.contains(robotActionType.rawValue))
            {
                robotDict[robotActionType.rawValue] = [RobotType]()
                
            }
            robotDict[robotActionType.rawValue]!.append(robot)
        }
    
        
        for robotActionType in robotDict{
            robotStruct.append(RobotWithAction(robotType:robotActionType.key, robots: robotActionType.value))
        }
        return robotStruct
    }
}
