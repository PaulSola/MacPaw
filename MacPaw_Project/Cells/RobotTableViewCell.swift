//
//  RobotTableViewCell.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 5/2/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import UIKit

class RobotTableViewCell: UITableViewCell {
    
    var delegate :CustomCellDelegator!
    
    let robotsCV = "robotsCV"
    
     let data = MyData()
    
    var robots : [RobotType]?
    
     let robotActionTypeTitle: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 10, width: Device.width - 20, height: 30))
        //label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name:"Helvetica-Bold", size: 25)
        label.textColor = .black
        return label
    }()
    
    let layout = UICollectionViewFlowLayout()
    lazy var robotsCollection = UICollectionView(frame: CGRect(x: 0, y: 40, width: Device.width , height: 210), collectionViewLayout: layout)
    
    //var robotsCollection : UICollectionView!
    
    func configurCell(title: String, robots: [RobotType]?){
        
        self.robots = robots
        self.robotActionTypeTitle.text = title
        
        layOutViews()
    }
    
    private func layOutViews (){
        
        
        
        
        layout.scrollDirection = .horizontal
        robotsCollection.backgroundColor = .clear
        //robotsCollection.translatesAutoresizingMaskIntoConstraints = false
        
        robotsCollection.delegate = self
        robotsCollection.dataSource = self
        
        contentView.addSubview(robotActionTypeTitle)
        contentView.addSubview(robotsCollection)
        robotsCollection.register(RobotCollectionCell.self, forCellWithReuseIdentifier: robotsCV)
        
//        robotsCollection.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
//        robotsCollection.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
//        robotsCollection.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
//        robotsCollection.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureNightMode(){
        
        robotsCollection.reloadData()
        robotActionTypeTitle.textColor = .white
        contentView.backgroundColor = .black
        
    }
    
    func configureDayMode(){
        
        robotsCollection.reloadData()
        robotActionTypeTitle.textColor = .black
        contentView.backgroundColor = .white
    }

}

extension RobotTableViewCell : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return robots?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: robotsCV, for: indexPath) as! RobotCollectionCell
        
        if let robot = robots?[indexPath.row].robot{
            cell.configureCell(title: robot.name, image: robot.robotImage)
            
        }
        //cell.configureCell(title: robot?.name ?? "robot",image: robot?.robotImage ?? "default")
        //cell.textLabel.textColor = .black
        
        data.getMode() ? cell.configureNightMode() : cell.configureDayMode()
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 200)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 15, bottom: 1, right: 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let chosenRobot = robots?[indexPath.row]
        self.delegate.callSegueFromCell(myData: chosenRobot as AnyObject)
        //performSegue(withIdentifier: "showRobot", sender: nil)
    }
    
    

}
