//
//  SportsTableViewCell.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 4/30/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import UIKit

class SportsTableViewCell: UITableViewCell {
    
    let sportImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        
        return image
    }()
    
    
    let sportLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Sport"
        label.font = UIFont(name:"Helvetica-light", size: 25)
        return label
    }()
    
    func configureSportView(sportName: String, image: String?){
        sportLabel.text = sportName
        sportImage.image = UIImage(named: image ?? "default")
        
        contentView.addSubview(sportLabel)
        contentView.addSubview(sportImage)
        
        sportLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        sportLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        sportLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 10).isActive = true
        sportLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        sportImage.topAnchor.constraint(equalTo: sportLabel.bottomAnchor, constant: 5).isActive = true
        sportImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        sportImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
        sportImage.heightAnchor.constraint(equalToConstant: Device.width * 3 / 4).isActive = true
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
