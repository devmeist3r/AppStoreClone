//
//  AppDetailHeaderCell.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 25/04/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class AppDetailHeaderCell: UICollectionViewCell {
    
    var app: App? {
        didSet {
            if let app = app {
                iconeImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
                nameLabel.text = app.nome
                companyLabel.text = app.empresa
            }
        }
    }
    
    let iconeImageView: UIImageView = .iconImageView(width: 128, height: 128)
    let nameLabel: UILabel = .textLabel(text: "App nome", fontSize: 20, numberOfLines: 2)
    let companyLabel: UILabel = .textLabel(text: "App empresa", fontSize: 14)
    let getButton: UIButton = .getButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        iconeImageView.image = UIImage(named: "icone")
        
        let buttonStackView = UIStackView(arrangedSubviews: [getButton, UIView()])
        
        let stackTitleCompany = UIStackView(arrangedSubviews: [nameLabel, companyLabel, buttonStackView])
        stackTitleCompany.spacing = 12
        stackTitleCompany.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [iconeImageView, stackTitleCompany])
        
        stackView.alignment = .center
        stackView.spacing = 12
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
