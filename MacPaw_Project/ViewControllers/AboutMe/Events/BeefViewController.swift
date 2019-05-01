//
//  BeefViewController.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/26/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import UIKit

class BeefViewController: UIViewController {
    
    let event : BeefEvent
    
    var scrollView = UIScrollView()
    
    let beefImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        image.backgroundColor = UIColor.clear
        image.image = UIImage(named: "BUK")
        
        return image
    }()
    
    let appView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    let linkTitle: UILabel = {
        
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Links"
        title.font = UIFont(name:"Helvetica", size: 30)
        
        return title
    }()
    
    let siteAppImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.image = UIImage(named: "BUK")
        image.isUserInteractionEnabled = true
        
        return image
    }()
    
    
    let beefAppImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.image = UIImage(named: "BUK")
        image.isUserInteractionEnabled = true
        
        return image
    }()
    
    let beefDescr: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "SomeSomeSSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomSomeSomeSSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeomeSomeSomeSomeSomeSomeSomeSomeSSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeomeSomeSomeSomeSomeSomeeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeSomeomeSomeSomeSomeSomeSome"
        label.font = UIFont(name:"Helvetica", size: 21)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()

    fileprivate func setScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(beefImage)
        scrollView.addSubview(beefDescr)
        scrollView.zeroConstraint( with: self.view)
        scrollView.backgroundColor = #colorLiteral(red: 0.772505552, green: 0.1750737086, blue: 0.05873733509, alpha: 1)
        self.scrollView.contentSize.height = 2000
        
        scrollView.addSubview(appView)
        appView.addSubview(beefAppImage)
        appView.addSubview(siteAppImage)
        
        beefAppImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showBeefApp)))
        siteAppImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showBeefSite)))
        
        
        
        
        //scrollView.addSubview(linkTitle)
        
        
    }
    
    @objc private func showBeefApp(){
        print("showBeefApp")
        
        navigationController?.pushViewController(BeefAppSoreSiteViewController(url: event.beefAppStoreURL!), animated: true)
    }
    @objc private func showBeefSite(){
        print("showBeefSite")
        navigationController?.pushViewController(BeefAppSoreSiteViewController(url: event.deefWebsiteURL!), animated: true)
    }
    

    
    init(event: Event) {
        self.event = event as! BeefEvent
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.navigationItem.title = "BEEF"
        
        
        setScrollView()
       
        beefImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        beefImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        beefImage.heightAnchor.constraint(equalToConstant:  Device.width).isActive = true
        beefImage.widthAnchor.constraint(equalToConstant: Device.width).isActive = true
        
        
        beefDescr.topAnchor.constraint(equalTo: beefImage.bottomAnchor, constant: 10).isActive = true
        //beefImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        //beefImage.widthAnchor.constraint(equalToConstant: Device.width - 20).isActive = true
        //beefDescr.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -10).isActive = true
        beefDescr.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10).isActive = true
        beefDescr.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
//        beefDescr.leftAnchor.constraint(equalTo: scrollView.leftAnchor,constant: 10).isActive = true
        
        appView.topAnchor.constraint(equalTo: beefDescr.bottomAnchor, constant: 15).isActive = true
        appView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        appView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        appView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        
        beefAppImage.topAnchor.constraint(equalTo: appView.topAnchor, constant: 20).isActive = true
        beefAppImage.leftAnchor.constraint(equalTo: appView.leftAnchor, constant: 10).isActive = true
        beefAppImage.heightAnchor.constraint(equalToConstant:  80).isActive = true
        beefAppImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        siteAppImage.topAnchor.constraint(equalTo: beefAppImage.bottomAnchor, constant: 40).isActive = true
        siteAppImage.leftAnchor.constraint(equalTo: appView.leftAnchor, constant: 10).isActive = true
        siteAppImage.heightAnchor.constraint(equalToConstant:  80).isActive = true
        siteAppImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        //print(scrollView.autoSizedHeight())
        
        
        
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
