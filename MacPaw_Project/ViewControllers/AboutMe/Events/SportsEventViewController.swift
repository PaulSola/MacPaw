//
//  SportsEventViewController.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/25/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import UIKit

class SportsEventViewController: UIViewController {
    
    
    
    var sportTableView = UITableView()
    //опцинальный ли
    let event : SportEvent
    var headerView = UIView()
    
    init(event: Event) {
        self.event = event as! SportEvent
        super.init(nibName: nil, bundle: nil)
    }
    //?????????
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //?????????
    
    func confTableView() {
        self.view.addSubview(sportTableView)
        
        sportTableView.translatesAutoresizingMaskIntoConstraints = false
        sportTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        sportTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        sportTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        sportTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        sportTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        sportTableView.delegate = self
        sportTableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        confTableView()
        
        
    }
    

}

extension SportsEventViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return event.sports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sportTableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = event.sports[indexPath.row].sportName
        return cell
    }
    
    
    
}
