//
//  RobotViewController.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/16/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import UIKit

class RobotViewController: UIViewController {
    
    let robotsTableView : UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        return tableView
    }()
    let robotTBcell = "robotTBcell"
    
    var robots: [RobotWithAction]?
    var chosenRobot : RobotType? = nil
    var collYPosition = 50
    let screenWidth = UIScreen.main.bounds.width
//    var collectionViews = [UICollectionView, UILabel]()
//
    var collectionViews: [(UILabel, UICollectionView)] = []
    let data = MyData()

   // @IBOutlet weak var robotScroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        NotificationCenter.default.addObserver(self, selector: #selector(darkModeEnabled(_:)), name: .nightModeEnabled, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(darkModeDisabled(_:)), name: .nightModeDisabled, object: nil)
        
        
        let robotService = RobotService()
        robotService.addRobots(){robots, error in
            if error == nil{
                self.robots = robots
//                for i in 0...robots!.count - 1 {
//                    self.collectionViews.append((self.addTitleHeader(i), self.createCollectionView(tag: i)))
               // }
            }
            else {print("Something gone wrong: ",error!)}
        }
        
        data.getMode() ? enableDarkMode() : disableDarkMode()
        
       // robotScroll.contentSize = CGSize(width: screenWidth, height:CGFloat( collYPosition + 50) )
        
        view.addSubview(robotsTableView)
        robotsTableView.zeroConstraint(with: self.view)
        robotsTableView.register(RobotTableViewCell.self, forCellReuseIdentifier: robotTBcell)
        
        robotsTableView.delegate = self
        robotsTableView.dataSource = self
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        if(data.getMode()){
//            self.tabBarController?.view.tintColor = UIColor.black
//            self.tabBarController?.tabBar.barStyle = .default
//        }
//
//    }
    
    @objc func darkModeEnabled(_ notification: Notification) {
        
        enableDarkMode()
        
        robotsTableView.reloadData()
    }

    @objc func darkModeDisabled(_ notification: Notification) {
        
        robotsTableView.reloadData()
        disableDarkMode()
    }

    
    open func enableDarkMode() {
        self.robotsTableView.backgroundColor = .black
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.view.backgroundColor = UIColor.black

    }
    
    open func disableDarkMode() {
        self.robotsTableView.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.view.backgroundColor = UIColor.white
    }

}


extension RobotViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return robots?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: robotTBcell) as! RobotTableViewCell
        cell.delegate = self
        if let robot = robots?[indexPath.row] {
            cell.configurCell(title: robot.robotType, robots: robot.robots)
        }
        //cell.textLabel?.text = robots?[indexPath.row].robotType
        data.getMode() ? cell.configureNightMode() : cell.configureDayMode()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    
}

extension RobotViewController : CustomCellDelegator {
    func callSegueFromCell(myData dataobject: AnyObject) {
        chosenRobot = dataobject as? RobotType
        performSegue(withIdentifier: "showRobot", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "showRobot":
            if let viewController = segue.destination as? DescrRobotViewController{
                
                viewController.robot = chosenRobot
            }
        default:
            print("No such identifier")
        }
    }

}

