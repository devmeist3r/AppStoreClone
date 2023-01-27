//
//  TodayDetailUnicCell.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 23/05/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class TodayDetailUnicCell: UITableViewCell {
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        
        let atributteText = NSMutableAttributedString(
            string: "Lorem Ipsum",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]
        )
        
        atributteText.append(NSAttributedString(
            string: " is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray]
        ))
        
        atributteText.append(NSAttributedString(
            string: " \n\nDe Onde ele vem?",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray]
        ))
        
        atributteText.append(NSAttributedString(
            string: " is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray]
        ))
        
        label.attributedText = atributteText
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(descriptionLabel)
        descriptionLabel.fillSuperview(
            padding: .init(
                top: 24,
                left: 24,
                bottom: 24,
                right: 24
            )
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
