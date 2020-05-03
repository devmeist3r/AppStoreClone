//
//  AppDetailEvaluationCell.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 27/04/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class AppDetailEvaluationCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var app: App? {
        didSet {
            if app != nil {
                self.collectionView.reloadData()
            }
        }
    }
    
    var titleLabel: UILabel = .textBoldLabel(text: "Avalições e opiniões", fontSize: 24)
    
    var collectionView: UICollectionView!
    
    let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(AppDetailCommentsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        addSubview(titleLabel)
        titleLabel.fill(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
        
        addSubview(collectionView)
        collectionView.fill(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.app?.comentarios?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppDetailCommentsCell
        
        if let comment = self.app?.comentarios?[indexPath.item] {
            cell.comment = comment
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.bounds.width - 40, height: collectionView.bounds.height)
    }
    
}
