//
//  TodayVC.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 17/05/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class TodayVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: .large)
        ai.color = UIColor.cinza
        ai.startAnimating()
        ai.hidesWhenStopped = true
        return ai
    }()
    
    let headerId = "headerId"
    let cellId = "cellId"
    let multiploId = "multiploId"
    var todayApps: [TodayApp] = []
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(TodayMultipleCell.self, forCellWithReuseIdentifier: multiploId)
        collectionView.register(TodayHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centralSuperview()
        
        self.getFeaturedApps()
        
        navigationController?.navigationBar.isHidden = true
        
    }
    
    func getFeaturedApps() {
        TodayService.shared.searchFeatured { (apps, error) in
            if let apps = apps {
                DispatchQueue.main.async {
                    self.todayApps = apps
                    self.collectionView.reloadData()
                    self.activityIndicatorView.stopAnimating()
                }
            }
        }
    }
    
}

extension TodayVC {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.bounds.width, height: 90)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header  = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! TodayHeader
        
        return header
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.todayApps.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item < 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TodayCell
            cell.todayApp = self.todayApps[indexPath.item]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: multiploId, for: indexPath) as! TodayMultipleCell
            cell.todayApp = self.todayApps[indexPath.item]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.bounds.width - 48, height: view.bounds.width + 48)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 24
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            if let frame = cell.superview?.convert(cell.frame, to: nil) {
                tabBarController?.tabBar.isHidden = true
                let modalView = TodayDetailVC()
                modalView.modalPresentationStyle = .overCurrentContext
                
                modalView.handlerClose = {
                    self.tabBarController?.tabBar.isHidden = false
                }
                
                let modalNav = UINavigationController(rootViewController: modalView)
                modalNav.modalPresentationStyle = .overCurrentContext
                modalNav.view.backgroundColor = .clear
                
                self.present(modalNav, animated: false) {
                    modalView.frame = frame
                    modalView.todayApp = self.todayApps[indexPath.item]
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 0, bottom: 20, right: 0)
    }
}
