//
//  AppDetailScreenschotCell.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 26/04/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class AppDetailScreenschotCellImage: UICollectionViewCell {
    
    let imageView: UIImageView = .screenshotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.image = UIImage(named: "screenshot")
        
        addSubview(imageView)
        imageView.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
