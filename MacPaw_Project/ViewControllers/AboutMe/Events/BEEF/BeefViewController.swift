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
    
    let siteAppLabel = UILabel().beefAppLabel()
    
    let beefAppLabel = UILabel().beefAppLabel()
    
    let siteAppImage = UIImageView().beefAppImage()
    
    let beefAppImage = UIImageView().beefAppImage()
        
    
    let beefDescr: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont(name:"Helvetica", size: 21)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()

    
    
    @objc private func showBeefApp(){
        print("showBeefApp")
        // ???????????????// открывает только если ссылка активированна из вне
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
    
    fileprivate func setScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(beefImage)
        scrollView.addSubview(beefDescr)
        scrollView.zeroConstraint( with: self.view)
        scrollView.backgroundColor = #colorLiteral(red: 0.772505552, green: 0.1750737086, blue: 0.05873733509, alpha: 1)
        //  ПЕРЕДЕЛАТЬ КОСТЫЛЬ СКРОЛ!!!!!
        //print(scrollView.autoSizedHeight())
        self.scrollView.contentSize.height = 1350
        
        scrollView.addSubview(appView)
        appView.addSubview(beefAppImage)
        appView.addSubview(siteAppImage)
        appView.addSubview(beefAppLabel)
        appView.addSubview(siteAppLabel)
        
        beefAppImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showBeefApp)))
        siteAppImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showBeefSite)))
        
        beefImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        beefImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        beefImage.heightAnchor.constraint(equalToConstant:  Device.width).isActive = true
        beefImage.widthAnchor.constraint(equalToConstant: Device.width).isActive = true
        
        beefDescr.topAnchor.constraint(equalTo: beefImage.bottomAnchor, constant: 10).isActive = true
        beefDescr.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10).isActive = true
        beefDescr.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
        setAppView()
        
        //scrollView.addSubview(linkTitle)
        
        
    }
    
    fileprivate func setAppView() {
        beefDescr.text = event.beefDescr
        siteAppImage.image = UIImage(named: "BUK1")
        
        appView.topAnchor.constraint(equalTo: beefDescr.bottomAnchor, constant: 15).isActive = true
        appView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        appView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        appView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        
        beefAppImage.topAnchor.constraint(equalTo: appView.topAnchor, constant: 20).isActive = true
        beefAppImage.leftAnchor.constraint(equalTo: appView.leftAnchor, constant: 10).isActive = true
        beefAppImage.heightAnchor.constraint(equalToConstant:  80).isActive = true
        beefAppImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        
        beefAppLabel.text = "<- Link to AppStore"
        beefAppLabel.centerYAnchor.constraint(equalTo: beefAppImage.centerYAnchor).isActive = true
        beefAppLabel.leftAnchor.constraint(equalTo: beefAppImage.rightAnchor, constant: 40).isActive = true
        
        
        
        siteAppImage.topAnchor.constraint(equalTo: beefAppImage.bottomAnchor, constant: 40).isActive = true
        siteAppImage.leftAnchor.constraint(equalTo: appView.leftAnchor, constant: 10).isActive = true
        siteAppImage.heightAnchor.constraint(equalToConstant:  80).isActive = true
        siteAppImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        siteAppLabel.text = "<- Link to Beef Site"
        siteAppLabel.centerYAnchor.constraint(equalTo: siteAppImage.centerYAnchor).isActive = true
        siteAppLabel.leftAnchor.constraint(equalTo: siteAppImage.rightAnchor, constant: 40).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.navigationItem.title = "BEEF"
        
        
        
        setScrollView()
        //print(scrollView.autoSizedHeight())
        
        
        
    }
    

}
