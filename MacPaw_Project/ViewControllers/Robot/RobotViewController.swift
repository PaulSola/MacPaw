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
    
    override func viewWillAppear(_ animated: Bool) {
        if(data.getMode()){
            self.tabBarController?.view.tintColor = UIColor.black
            self.tabBarController?.tabBar.barStyle = .default
        }
        
    }
    
    @objc func darkModeEnabled(_ notification: Notification) {
        
        enableDarkMode()
        
        robotsTableView.reloadData()
//        for collection in collectionViews {
//            collection.1.reloadData()
//
//        }
    }

    @objc func darkModeDisabled(_ notification: Notification) {
        
        robotsTableView.reloadData()
        disableDarkMode()
//        for collection in collectionViews {
//            collection.1.reloadData()
//
//        }
    }

    
    open func enableDarkMode() {
        print("darkModeEnabled ")
        self.robotsTableView.backgroundColor = UIColor.black
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.view.backgroundColor = UIColor.black
//        for collection in collectionViews {collection.0.textColor = .white}

    }
    
    open func disableDarkMode() {
        print("darkModeDisabled ")
        self.robotsTableView.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.barStyle = .default
        self.navigationController?.view.backgroundColor = UIColor.white
//        for collection in collectionViews {collection.0.textColor = .black}

    }

    
//    func createCollectionView(tag:Int) -> UICollectionView{
//
//
//        let layout = UICollectionViewFlowLayout()
//        let collection = UICollectionView(frame: CGRect(x: 0, y: collYPosition, width: Int(robotScroll.frame.width), height: 210), collectionViewLayout: layout)
//        layout.scrollDirection = .horizontal
//        collection.backgroundColor = .clear
//        collection.translatesAutoresizingMaskIntoConstraints = false
//        collection.isScrollEnabled = true
//
//        collection.tag = tag
//        collection.register(RobotCollectionCell.self, forCellWithReuseIdentifier: "cellId")
//
//        collection.delegate = self
//        collection.dataSource = self
//
//        robotScroll.addSubview(collection)
//        collYPosition += 260
//
//        return collection
//    }
//    func addTitleHeader(_ index:Int) -> UILabel{
//        let subLabel = UILabel()
//        subLabel.frame = CGRect(x: 15, y: collYPosition - 30, width: Int( screenWidth - 15),height: 30)
//        subLabel.text = robots?[index].robotType
//        subLabel.font = UIFont(name:"Helvetica-bold", size: 20)
//        robotScroll.addSubview(subLabel)
//
//        return subLabel
//    }
    
   
}

//extension RobotViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return robots?[collectionView.tag].robots.count ?? 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! RobotCollectionCell
//
//        let robot = robots?[collectionView.tag].robots[indexPath.row].robot
//
//        cell.configureCell(title: robot?.name ?? "robot",image: robot?.robotImage ?? "default")
//        //cell.textLabel.textColor = .black
//
//        data.getMode() ? cell.configureNightMode() : cell.configureDayMode()
//
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 250, height: 200)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 1, left: 15, bottom: 1, right: 15)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        chosenRobot = (robots?[collectionView.tag].robots[indexPath.row])!
//
//        performSegue(withIdentifier: "showRobot", sender: nil)
//    }
//

   
//    func pushView(){
//        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController {
//            if let navigator = navigationController {
//                navigator.pushViewController(viewController, animated: true)
//            }
//        }
//    }
    
//}

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

