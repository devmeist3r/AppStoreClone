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
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)
        ai.color = UIColor.cinza
        ai.startAnimating()
        ai.hidesWhenStopped = true
        return ai
    }()
    
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
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centralSuperview()
        
        self.searchApps()
        
    }
    
}

extension AppsVC {
    
    func searchApps() {
        var appsFeatured: [FeaturedApp]?
        var appsLovely: AppGrouop?
        var topAppsFree: AppGrouop?
        var topAppsPaid: AppGrouop?
        
        let dispatchGroup = DispatchGroup()
        
        // Apps em destque
        dispatchGroup.enter()
        AppService.shared.getFeaturedApps { (apps, err) in
            appsFeatured = apps
            dispatchGroup.leave()
        }
        
        // Top apps amamos
        dispatchGroup.enter()
        AppService.shared.getGroupApp(type: "apps-que-amamos") { (group, error) in
            appsLovely = group
            dispatchGroup.leave()
        }
        
        // Top apps gratis
        dispatchGroup.enter()
        AppService.shared.getGroupApp(type: "top-apps-gratis") { (group, error) in
            topAppsFree = group
            dispatchGroup.leave()
        }
        
        // Top apps pagos
        dispatchGroup.enter()
        AppService.shared.getGroupApp(type: "top-apps-pagos") { (group, error) in
            topAppsPaid = group
            dispatchGroup.leave()
        }
        
        
        dispatchGroup.notify(queue: .main) {
            if let apps = appsFeatured {
                self.appsFeatured = apps
            }
            
            if let apps = appsLovely {
                self.appsGroup.append(apps)
            }
            
            if let apps = topAppsFree {
                self.appsGroup.append(apps)
            }
            
            if let apps = topAppsPaid {
                self.appsGroup.append(apps)
            }
            
            self.activityIndicatorView.stopAnimating()
            self.collectionView.reloadData()
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
        cell.appsGroupHorizontalVC.callback = { (app) in
            let appDetailVC = AppDetailVC()
            self.navigationController?.pushViewController(appDetailVC, animated: true
            )
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.bounds.width, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 0, bottom: 20, right: 0)
    }
}
