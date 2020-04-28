//
//  AppDetailCommentsCell.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 27/04/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class AppDetailCommentsCell: UICollectionViewCell {
    
    let titleLabel: UILabel = .textBoldLabel(text: "Muito bom", fontSize: 16)
    let commentLabel: UILabel = .textLabel(text: "Recomendo bastante esse app, esta me ajudando muito.", fontSize: 16, numberOfLines: 0)
    
    let evaluationImageView: UIImageView = {
        let image = UIImageView()
        image.size(size: .init(width: 120, height: 24))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.background
        layer.cornerRadius = 12
        layer.masksToBounds = true
        clipsToBounds = true
        
        evaluationImageView.image = UIImage(named: "avaliacao-1")
        
        let headerStackView = UIStackView(arrangedSubviews: [titleLabel, evaluationImageView])
        
        let commentStackView = UIStackView(arrangedSubviews: [commentLabel])
        commentStackView.alignment = .top
        
        let stackView = UIStackView(arrangedSubviews: [headerStackView, commentStackView])
        stackView.axis = .vertical
        stackView.spacing = 12
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
