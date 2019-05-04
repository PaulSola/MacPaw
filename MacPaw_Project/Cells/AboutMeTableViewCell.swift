//
//  AboutMeTableViewCell.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/19/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import UIKit

class AboutMeTableViewCell: UITableViewCell {
    
    let likeView = LikeMeView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
    
    let data = MyData()
    
     let baseView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
//        view.layer.shadowColor = UIColor.black.cgColor
//        view.layer.shadowOpacity = 0.5
//        view.layer.shadowOffset = CGSize.init(width: -10, height: 10)
//        view.layer.shadowRadius = 5
       

        
        return view
    }()
    
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.clipsToBounds = false
        view.backgroundColor = .white
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize.init(width: -10, height: 10)
        view.layer.shadowRadius = 5

        return view
    }()
    
    let titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    
     let eventImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        image.backgroundColor = UIColor.clear
        
        return image
    }()
    
    let eventTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Some"
        label.font = UIFont(name:"Helvetica", size: 21)
        label.numberOfLines = 2
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureNightMode(){
        
        //titleView.backgroundColor = .white
        contentView.backgroundColor = #colorLiteral(red: 0.004211155586, green: 0.01019812174, blue: 0.1954909581, alpha: 1)
        view.layer.shadowColor = UIColor.clear.cgColor
    }
    
    func configureDayMode(){
        
        //robotActionTypeTitle.textColor = .black
        contentView.backgroundColor = #colorLiteral(red: 0.9313134518, green: 0.9313134518, blue: 0.9313134518, alpha: 1)
        view.layer.shadowColor = UIColor.black.cgColor
    }
    
    func createView(image: String?, title: String){
        let screenWidth = UIScreen.main.bounds.width
        
        
        self.contentView.addSubview(view)
        self.contentView.addSubview(baseView)
        
        baseView.addSubview(eventImageView)
        baseView.addSubview(titleView)
        titleView.addSubview(eventTitle)
        titleView.addSubview(likeView)
        //baseView.addSubview(eventTitle)
        
        view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        view.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25).isActive = true
        view.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25).isActive = true
        view.heightAnchor.constraint(equalToConstant: CGFloat(Int(screenWidth - 50)/3*4) - 20).isActive = true
        
        baseView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        baseView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25).isActive = true
        baseView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -25).isActive = true
        baseView.heightAnchor.constraint(equalToConstant: CGFloat(Int(screenWidth - 50)/3*4) - 20).isActive = true
        
        eventImageView.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 0).isActive = true
        eventImageView.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 0).isActive = true
        eventImageView.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: 0).isActive = true
        eventImageView.heightAnchor.constraint(equalToConstant: CGFloat(Int(screenWidth - 50)/3*4) - 100).isActive = true

        eventImageView.image = UIImage(named: image ?? "default")
        
        titleView.topAnchor.constraint(equalTo: eventImageView.bottomAnchor, constant: 0).isActive = true
        titleView.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 0).isActive = true
        titleView.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: 0).isActive = true
        titleView.bottomAnchor.constraint(equalTo: baseView.bottomAnchor, constant: 0).isActive = true
        
        likeView.translatesAutoresizingMaskIntoConstraints = false
        likeView.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        likeView.rightAnchor.constraint(equalTo: baseView.rightAnchor, constant: -20).isActive = true
        likeView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        likeView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        eventTitle.centerYAnchor.constraint(equalTo: titleView.centerYAnchor, constant: -5).isActive = true
        eventTitle.leftAnchor.constraint(equalTo: baseView.leftAnchor, constant: 10).isActive = true
        eventTitle.rightAnchor.constraint(equalTo: likeView.leftAnchor, constant: -10).isActive = true
        //eventTitle.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
        eventTitle.text = title
        
    }

}
