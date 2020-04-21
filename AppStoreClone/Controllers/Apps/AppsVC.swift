//
//  AppsVC.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 21/04/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class AppsVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let headerId = "headerId"
    let cellId = "cellId"
    var appsFeatured: [FeaturedApp] = []
    var appsGroup: [AppGrouop] = []
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(AppsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsVerticalScrollIndicator = false
        
        self.searchFeaturedApp()
        
        self.getGroups(tipo: "apps-que-amamos")
        self.getGroups(tipo: "top-apps-gratis")
        self.getGroups(tipo: "top-apps-pagos")
    }
    
}

extension AppsVC {
    
    func searchFeaturedApp() {
        AppService.shared.getFeaturedApps { (apps, err) in
            if let err = err {
                print(err)
                return
            }
            
            if let apps = apps {
                DispatchQueue.main.async {
                    self.appsFeatured = apps
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    func getGroups(tipo: String) {
        AppService.shared.getGroupApp(type: tipo) { (group, err) in
            if let err = err {
                print(err)
                return
            }
            
            if let group = group {
                DispatchQueue.main.async {
                    self.appsGroup.append(group)
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
}

extension AppsVC {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appsGroup.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsHeader
        
        header.appsFeatured = self.appsFeatured
        header.collectionView.reloadData()
        
        return header
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.bounds.width, height: view.bounds.width * 0.8)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        
        cell.group = self.appsGroup[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 0, bottom: 20, right: 0)
    }
}
