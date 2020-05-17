//
//  UIImageView.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 20/04/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

extension UIImageView {
    
    static func iconImageView(width: CGFloat = 64, height: CGFloat = 64) -> UIImageView {
        let image = UIImageView()
        
        image.size(size: .init(width: width, height: height))
        image.layer.borderWidth = 0.5
        image.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        
        return image
    }
    
    static func screenshotImageView () -> UIImageView {
        let image =  UIImageView()
        
        image.layer.cornerRadius = 12
        image.layer.borderWidth = 0.5
        image.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        
        
        return image
    }
    
    static func todayImageView(named: String? = nil) -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        if let named = named {
            image.image = UIImage(named: named)
        }
        image.contentMode = .scaleAspectFill
        return image
    }
    
}
