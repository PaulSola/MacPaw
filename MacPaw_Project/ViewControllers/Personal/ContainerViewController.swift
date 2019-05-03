//
//  ContainerViewController.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/19/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    var mainView : PersonalCab!
    var rightView : SettingsViewController! // ? or not !
    
    enum SlideOutState {
        case bothCollapsed
        case leftPanelExpanded
    }
    var currentState: SlideOutState = .bothCollapsed {
        didSet {
            let shouldShowShadow = currentState != .bothCollapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }
    
    func showShadowForCenterViewController(_ shouldShowShadow: Bool) {
        
        if shouldShowShadow {
            mainView.view.layer.shadowOpacity = 1
        } else {
            mainView.view.layer.shadowOpacity = 0.0
        }
    }
    
        let centerPanelExpandedOffset: CGFloat = 60

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PersonalCab") as? PersonalCab
        
        mainView.delegate = self  // @objc optional func
        view.addSubview(mainView.view)
        addChild(mainView)
        
        mainView.didMove(toParent: self)
        
        rightView = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController
         addChildSideController(rightView)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        mainView.view.addGestureRecognizer(panGestureRecognizer)
        
        // Do any additional setup after loading the view.
    }
    
    func addChildSideController(_ sidePanelController: SettingsViewController) {
        
        view.insertSubview(sidePanelController.view, at: 0)
        
        addChild(sidePanelController)
        sidePanelController.didMove(toParent: self)
    }

}

extension ContainerViewController: PersonalViewDelegate{
    func showRightPanel() {
        let notAlreadyExpanded = (currentState != .leftPanelExpanded)
        
        if notAlreadyExpanded {
            addLeftPanelViewController()
        }
        
        animateLeftPanel(shouldExpand: notAlreadyExpanded)
    }
    

    func addLeftPanelViewController() {
        
        guard rightView == nil else { return }
        
        if let vc = UIStoryboard.rightViewController() {
            //vc.students = StudentTableRows.studentRows()
            //addChildSideController(vc)
            rightView = vc
        }
    }
    
    func animateLeftPanel(shouldExpand: Bool) {
        
        if shouldExpand {
            currentState = .leftPanelExpanded
            animateCenterPanelXPosition(
                targetPosition: mainView.view.frame.width - Device.width/2)
            
        } else {
            animateCenterPanelXPosition(targetPosition: 0) { finished in
                self.currentState = .bothCollapsed
                //self.rightView?.view.removeFromSuperview()
                //self.rightView = nil
            }
        }
    }
    
    func animateCenterPanelXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)? = nil) {
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut, animations: {
                        self.mainView.view.frame.origin.x = -targetPosition
        }, completion: completion)
    }
    
    
}


extension ContainerViewController: UIGestureRecognizerDelegate {
    
    @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        
        let gestureIsDraggingFromRightToLeft = (recognizer.velocity(in: view).x < 0)
        //print(recognizer.velocity(in: view).x)
        switch recognizer.state {
            
        case .began:
            if currentState == .bothCollapsed {
                if gestureIsDraggingFromRightToLeft {
                    addLeftPanelViewController()
                    print("ADDED")
                }
                
                showShadowForCenterViewController(true)
            }
            
        case .changed:
            
            if let rview = recognizer.view {
                
                    if(rview.center.x <= view.bounds.size.width/2){
                        rview.center.x = rview.center.x + recognizer.translation(in: view).x
                        recognizer.setTranslation(CGPoint.zero, in: view)
                    }

                
            }
        
            
            
        case .ended:
            if let _ = rightView,
                let rview = recognizer.view {
                // animate the side panel open or closed based on whether the view
                // has moved more or less than halfway
                print(rview.center.x)
                let hasMovedGreaterThanHalfway = rview.center.x <= Device.width/4
                animateLeftPanel(shouldExpand: hasMovedGreaterThanHalfway)
                
            }else{print("NONe")}
            
        default:
            break
        }
        
    }
}

private extension UIStoryboard {
    
    static func main() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
    
    static func rightViewController() -> SettingsViewController? {
        return main().instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController
    }
    
    static func mainCenterViewController() -> PersonalCab? {
        return main().instantiateViewController(withIdentifier: "PersonalCab") as? PersonalCab
    }
}


