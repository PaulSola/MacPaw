//
//  SettingsViewController.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/19/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import UIKit
import MessageUI

class SettingsViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mailSize = CGFloat(150)
        let mailViewX = Device.width*3/4 - mailSize/2
        let mailViewY = Device.height/2 - mailSize/2
        
        
        let mailView = UIImageView(frame: CGRect(x:mailViewX, y: mailViewY, width: mailSize, height: mailSize))
        mailView.backgroundColor = .clear
        mailView.image = UIImage(named: "email_me")
        mailView.isUserInteractionEnabled = true
        
        mailView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapEmail)))
        self.view.addSubview(mailView)
//        let button:UIButton = UIButton(frame: CGRect(x: Device.width - 100, y: 50, width: 100, height: 50))
//        button.backgroundColor = .black
//        button.setTitle("Button", for: .normal)
//        button.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside)
//        self.view.addSubview(button)
//

        // Do any additional setup after loading the view.
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["pashasolyanikov@gmail.com"])
            mail.setMessageBody("<p>Hi Pasha!</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            let alert = UIAlertController(title: "Alert", message: "Might be simulator.....", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
 
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    @objc private func tapEmail (){
        print("KLICK")
        sendEmail()
    }
    

}
