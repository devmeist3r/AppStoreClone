//
//  AppDetailDescription.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 25/04/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class AppDetailDescriptionCell: UICollectionViewCell {
    
    let titleLabel: UILabel = .textBoldLabel(text: "Novidades", fontSize: 24)
    let descriptionLabel: UILabel = .textLabel(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", fontSize: 12, numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.spacing = 12
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
