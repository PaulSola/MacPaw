//
//  RobotCollectionCell.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/16/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation
import UIKit

class RobotCollectionCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.backgroundColor = UIColor.gray
        
        return image
    }()
    
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "New Dish"
        label.font = UIFont(name:"Helvetica-light", size: 15)
        return label
    }()
    
    func configureCell(title: String, image: String){
        
        textLabel.text = title
        imageView.image = UIImage(named: image)
    }
    
    func configureNightMode(){
        
        textLabel.textColor = .black
        contentView.backgroundColor = UIColor(red: 0, green: 0.4, blue: 0.8588, alpha: 1.0)
        
    }
    
    func configureDayMode(){
        
        textLabel.textColor = .white
        contentView.backgroundColor = .orange
    }
    
    func  setupView(){
        
        //contentView.backgroundColor = .gray
        contentView.layer.cornerRadius = 20
        
        addSubview(imageView)
        addSubview(textLabel)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false;
        textLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        textLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        textLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        imageView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 5).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override var isSelected: Bool{
//        didSet{
//            if self.isSelected
//            {
//                imageView.layer.opacity = 0.7
//                //contentView.backgroundColor = .black
//            }
//            else
//            {
//                
//                imageView.layer.opacity = 1
//                //contentView.backgroundColor = .white
//            }
//            
//        }
//        
//    }
    
    
}

extension UIView{
    func roundedView(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: [.bottomLeft , .bottomRight],
                                     cornerRadii: CGSize(width: 8, height: 8))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}


