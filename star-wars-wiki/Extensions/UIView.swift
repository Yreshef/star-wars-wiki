//
//  UIView.swift
//  star-wars-wiki
//
//  Created by Yohai Reshef on 02/08/2021.
//  Copyright © 2021 YReshef. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor,
                leading: NSLayoutXAxisAnchor,
                bottom: NSLayoutYAxisAnchor,
                trailing: NSLayoutXAxisAnchor,
                padding: UIEdgeInsets = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: top,
                             constant: padding.top).isActive = true
        leadingAnchor.constraint(equalTo: leading,
                           constant: padding.left).isActive = true
        bottomAnchor.constraint(equalTo: bottom,
                                constant: -padding.bottom).isActive = true
        trailingAnchor.constraint(equalTo: trailing,
                                  constant: -padding.right).isActive = true
    }
    
    func anchor(to view: UIView, padding: UIEdgeInsets = .zero) {
        self.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: padding)
    }
    
}
