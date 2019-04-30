//
//  AboutMeViewController.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/19/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//
//let indexPath = self.tableView.indexPathForSelectedRow()

import UIKit

class AboutMeViewController: UIViewController {
    //dictionary
    
    @IBOutlet weak var aboutMeTableView: UITableView!
    let screenWidth = UIScreen.main.bounds.width
    
    var events = [Event]()
    
    let eventService = EventService()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutMeTableView.backgroundColor = #colorLiteral(red: 0.9313134518, green: 0.9313134518, blue: 0.9313134518, alpha: 1)
        
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: aboutMeTableView)
        }
        
        eventService.appendEvent(&events)
        
    }
    

}

extension AboutMeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutMeCell", for: indexPath) as! AboutMeTableViewCell
        
        let event = events[indexPath.row]
        
        cell.createView(image: event.eventImage, title: event.eventName)

        //cell.text = events[indexPath.row].name
        
        //if let baseView = cell.baseView {
            registerForPreviewing(with: self, sourceView: cell.baseView)
        //}
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let destination = eventDestination(event: events[indexPath.row]) {
            navigationController?.pushViewController(destination, animated: true)

        }
//        let destination = SportsEventViewController(event: events[indexPath.row]) // Your destination
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (screenWidth - 50)/3*4 + 15
    }
    
    // лучше через мапу
    
    func eventDestination(event:Event) -> UIViewController?
    {
        
        switch event {
        case is SportEvent:
            return SportsEventViewController(event: event)
        case is BeefEvent:
            return BeefViewController()
        default:
            return nil
//            return dictionary.get(event)
        }
    }
    
    
}

extension AboutMeViewController: UIViewControllerPreviewingDelegate{
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {

        let sourceView = previewingContext.sourceView

        if(sourceView != aboutMeTableView){
            guard let indexPath = aboutMeTableView.indexPathForSubview(sourceView) else {
                return nil
            }
            previewingContext.sourceRect = sourceView.bounds

            guard let destination = eventDestination(event: events[indexPath.row]) else{
                return nil
            }
            return destination
        }
            return nil
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }

    
    
}

extension UITableView { // CHECK THIS!!!
    func cellForSubview(_ subview: UIView) -> UITableViewCell? {
        var superview = subview.superview
        
        while superview != nil {
            if superview is UITableViewCell {
                return superview as? UITableViewCell
            }
            
            superview = superview?.superview
        }
        
        return nil
    }
    func indexPathForSubview(_ subview: UIView) -> IndexPath? {
        if let cell = cellForSubview(subview) {
            return indexPath(for: cell)
        }
        
        return nil
    }
}
