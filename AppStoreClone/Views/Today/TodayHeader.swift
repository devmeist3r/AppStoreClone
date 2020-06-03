//
//  TodayHeader.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 03/06/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class TodayHeader: UICollectionReusableView {
    
    let dateLabel: UILabel = .textLabel(text: "DOMINGO, 1 DE MARÇO", fontSize: 14)
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hoje"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 34)
        return label
    }()
    
    let perfilImageView: UIImageView = {
        let image = UIImageView()
        image.size(size: .init(width: 36, height: 36))
        image.layer.cornerRadius = 18
        image.image = UIImage(named: "perfil")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(dateLabel)
        dateLabel.fill(
            top: topAnchor,
            leading: leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 32, left: 24, bottom: 0, right: 0)
        )
        
        addSubview(titleLabel)
        titleLabel.fill(
            top: nil,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: nil,
            padding: .init(top: 0, left: 24, bottom: 0, right: 0)
        )
        
        addSubview(perfilImageView)
        perfilImageView.fill(
            top: nil,
            leading: nil,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 0, left: 0, bottom: 0, right: 24)
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
