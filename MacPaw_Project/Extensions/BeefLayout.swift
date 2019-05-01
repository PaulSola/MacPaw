//
//  BeefLayout.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 5/1/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func beefAppImage() -> UIImageView {
        
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.contentMode = .scaleAspectFill
            image.clipsToBounds = true
            image.layer.cornerRadius = 20
            image.image = UIImage(named: "BUK")
            image.isUserInteractionEnabled = true
            
            return image
    }
}
extension UILabel{
    func beefAppLabel() -> UILabel{
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont(name:"Helvetica", size: 21)
        title.textColor = .white
        title.numberOfLines = 1
        
        return title
    }
}
