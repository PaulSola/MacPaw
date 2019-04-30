//
//  PersonalCab.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/16/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import UIKit

class PersonalCab: UIViewController {
    
    let data = MyData()
    let backgroundImageView = UIImageView()
    
    var delegate : PersonalViewDelegate?

    @IBOutlet weak var personalView: UIView!
    
    @IBOutlet weak var nightSwitch: UISwitch!
    
    @IBAction func nightModeSwitch(_ sender: UISwitch) {

        if(sender.isOn){
           enableDarkMode()
            NotificationCenter.default.post(name: .nightModeEnabled , object: nil)
        }
        else{
           disableDarkMode()
            NotificationCenter.default.post(name: .nightModeDisabled , object: nil)
        }

            data.saveMode(sender.isOn)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackground()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        let currentMode = data.getMode()
        nightSwitch.isOn = currentMode
        currentMode ? enableDarkMode() : disableDarkMode()
    }
    
    func setBackground(){
        
        personalView.layer.cornerRadius = 10
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        self.view.sendSubviewToBack(backgroundImageView)
    }
    
    func enableDarkMode(){
        self.tabBarController?.view.tintColor = UIColor.white
        self.tabBarController?.tabBar.barStyle = .black
        backgroundImageView.image = UIImage(named: "backgroundNight")
    }
    func disableDarkMode(){
        self.tabBarController?.view.tintColor = UIColor.blue
        self.tabBarController?.tabBar.barStyle = UIBarStyle.default
        backgroundImageView.image = UIImage(named: "backgroundDay")
    }
    
    
    
    @IBAction func tapped(_ sender: Any) {
        
        self.delegate?.showRightPanel()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
