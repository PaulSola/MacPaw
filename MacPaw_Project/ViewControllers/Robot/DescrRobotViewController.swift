//
//  DescrRobotViewController.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/16/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import UIKit

class DescrRobotViewController: UIViewController {
    
    @IBOutlet var moveRobotView: UIView!
    var effect = UIVisualEffectView()
    let blurEffect = UIBlurEffect(style: .light)
    
    @IBOutlet weak var moveLabel: UILabel!
    
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.text = "Robot"
        label.font = UIFont(name:"Helvetica-Bold", size: 20)
        return label
    }()
    
    let descText: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .left
        textView.textColor = .black
        textView.text = "Robot Desc"
        textView.font = UIFont(name:"Helvetica-light", size: 17)
        return textView
    }()
    
    let deviceWidth = UIScreen.main.bounds.size.width
    var robot : RobotType! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //effect.effect = nil
        moveRobotView.layer.cornerRadius = 8
        
        self.navigationItem.title = robot.robot.name;
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(addTapped))
        
        
        
        
        print(robot.move())
        setUpView()

        // Do any additional setup after loading the view.
    }
    
    @objc func addTapped(){
//         let alertController = UIAlertController(title: "Caution", message: robot.move(), preferredStyle: .actionSheet)
//        let cancelAction = UIAlertAction(title: "OK", style: .default)
//
//        alertController.addAction(cancelAction)
//        self.present(alertController, animated: true, completion: nil)
        view.bringSubviewToFront(effect)
        self.moveLabel.text = robot.move()
        
        self.view.addSubview(moveRobotView)
        moveRobotView.center = self.view.center
        
        moveRobotView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        moveRobotView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
        
            self.effect.effect = self.blurEffect
            self.moveRobotView.alpha = 1
            self.moveRobotView.transform = CGAffineTransform.identity
            
        }
        
       

       
    }
    
    @IBAction func doneButton(_ sender: Any) {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.moveRobotView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.moveRobotView.alpha = 0
            self.effect.effect = nil
            
        }) { (_) in
            self.view.sendSubviewToBack(self.effect)
            self.moveRobotView.removeFromSuperview()
        }
    }
    
    
    func setUpView(){
        
        let selfAdjust = self.view.safeAreaLayoutGuide
        
        effect.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(effect)
        
        effect.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        effect.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        effect.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        effect.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        self.view.addSubview(imageView)
        imageView.image = UIImage(named: robot.robot.robotImage)
        imageView.topAnchor.constraint(equalTo: selfAdjust.topAnchor, constant: 30).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: CGFloat(Int(deviceWidth - 20)/4*3)).isActive = true

        self.view.addSubview(titleLabel)
        titleLabel.text = robot.getInfo() + " " + robot.robot.performAction()
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
        self.view.addSubview(descText)
        descText.text = robot.robot.description
        descText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        descText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        descText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        descText.bottomAnchor.constraint(equalTo: selfAdjust.bottomAnchor, constant: -10).isActive = true
        
        //auto sizing instead constraints
        
       
        
    }
}
