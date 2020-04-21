//
//  AppsGroupHorizontalCell.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 21/04/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit
import SDWebImage

class AppsGroupHorizontalCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            if let app = app {
                iconImageView.sd_setImage(with: (URL(string: app.iconeUrl)), completed: nil)
                titleLabel.text = app.nome
                companyLabel.text = app.empresa
            }
        }
    }
    
    let iconImageView: UIImageView = .iconImageView()
    let titleLabel: UILabel = .textLabel(text: "App nome", fontSize: 18, numberOfLines: 2)
    let companyLabel: UILabel = .textLabel(text: "App empresa", fontSize: 14)
    let getButton: UIButton = .getButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 80, y: bounds.height, width: bounds.width - 80, height: 0.8)
        bottomLine.backgroundColor = UIColor.cinza.cgColor
        layer.addSublayer(bottomLine)
        
        let titleCompanyStackView = UIStackView(arrangedSubviews: [titleLabel, companyLabel])
        titleCompanyStackView.spacing = 4
        titleCompanyStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleCompanyStackView, getButton])
        stackView.spacing = 12
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
