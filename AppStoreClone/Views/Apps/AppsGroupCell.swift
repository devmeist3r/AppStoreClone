//
//  AppsGroupCell.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 21/04/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    let titleLabel: UILabel = .textBoldLabel(text: "App grupo titulo", fontSize: 24)
    
    let appsGroupHorizontalVC = AppsGroupHorizontalVC()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue
        
        addSubview(titleLabel)
        titleLabel.fill(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: nil,
            trailing: trailingAnchor,
            padding: .init(top: 0, left: 20, bottom: 0, right: 20)
        )
        
        addSubview(appsGroupHorizontalVC.view)
        
        appsGroupHorizontalVC.view.fill(
            top: titleLabel.bottomAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            padding: (.init(top: 10, left: 0, bottom: 0, right: 0))
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
