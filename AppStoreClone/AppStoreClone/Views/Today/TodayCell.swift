//
//  TodayCell.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 17/05/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    var todayApp: TodayApp? {
        didSet {
            if let todayApp = todayApp {
                categoryLabel.text = todayApp.categoria
                titleLabel.text = todayApp.titulo
                descriptionLabel.text = todayApp.descricao
                
                if let image = todayApp.imageUrl {
                    imagemView.image = UIImage(named: image)
                }
                
                if let background = todayApp.backgroundColor {
                    self.backgroundColor = UIColor(hexString: background)
                }
            }
        }
    }
    
    let categoryLabel: UILabel = .textLabel(text: "VIAGEM", fontSize: 18)
    let titleLabel: UILabel = .textBoldLabel(text: "Explore o mundo \nsem medo", fontSize: 28, numberOfLines: 2)
    let imagemView: UIImageView = .todayImageView(named: "destaque-1")
    let descriptionLabel: UILabel = .textLabel(text: "Podemos viajar o mundo em busca da beleza, mas nunca encontramos se não a carregarmos dentro de nós.", fontSize: 14, numberOfLines: 3)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let boxView = UIView()
        boxView.clipsToBounds = true
        boxView.addSubview(imagemView)
        
        imagemView.centerXAnchor.constraint(equalTo: boxView.centerXAnchor).isActive = true
        imagemView.centerYAnchor.constraint(equalTo: boxView.centerYAnchor).isActive = true
        imagemView.size(size: .init(width: bounds.width, height: 250))
        
        let stackView = UIStackView(arrangedSubviews: [categoryLabel, titleLabel, boxView, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
//        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        stackView.fill(
            top: self.safeAreaLayoutGuide.topAnchor,
            leading: leadingAnchor,
            bottom: bottomAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 24, left: 24, bottom: 24, right: 24)
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
