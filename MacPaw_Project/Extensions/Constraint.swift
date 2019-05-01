//
//  Constraint.swift
//  MacPaw_Project
//
//  Created by Paul Solyanikov on 5/1/19.
//  Copyright © 2019 Paul Solyanikov. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func zeroConstraint(with parentView: UIView){
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 0).isActive = true
        self.rightAnchor.constraint(equalTo: parentView.rightAnchor, constant: 0).isActive = true
        self.leftAnchor.constraint(equalTo: parentView.leftAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: 0).isActive = true
    }
    
    func autoSizedHeight() -> CGSize{
        var contentRect = CGRect.zero
        
        for subView in self.subviews {
            contentRect = contentRect.union(subView.frame)
        }
        return contentRect.size
    }
    
}
