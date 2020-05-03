//
//  AppDetailVC.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 22/04/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class AppDetailVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let headerId = "headerId"
    let descriptionId = "descriptionId"
    let screenshotId = "screenshotId"
    let evaluationId = "evaluationId"
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        ai.color = .cinza
        ai.startAnimating()
        ai.hidesWhenStopped = true
        
        return ai
    }()
    
    var appId: Int! {
        didSet {
            self.searchApp(appId: appId)
        }
    }
    
    var app: App?
    var loading: Bool = true
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailHeaderCell.self, forCellWithReuseIdentifier: headerId)
        collectionView.register(AppDetailDescriptionCell.self, forCellWithReuseIdentifier: descriptionId)
        collectionView.register(AppDetailScreenShotCell.self, forCellWithReuseIdentifier: screenshotId)
        collectionView.register(AppDetailEvaluationCell.self, forCellWithReuseIdentifier: evaluationId)
        collectionView.showsVerticalScrollIndicator = false
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.centralSuperview()
        
        navigationItem.title = app?.nome
    }
    
    func searchApp(appId: Int) {
        AppService.shared.searchAppId(appId: appId) { (app, err) in
            if let app = app {
                DispatchQueue.main.async {
                    self.activityIndicatorView.stopAnimating()
                    self.loading = false
                    self.app = app
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.loading ? 1 : 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerId, for: indexPath) as! AppDetailHeaderCell
            cell.app = self.app
            return cell
        }
        
        if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: descriptionId, for: indexPath) as! AppDetailDescriptionCell
            cell.app = self.app
            return cell
        }
        
        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: screenshotId, for: indexPath) as! AppDetailScreenShotCell
            
            cell.backgroundColor = .white
            cell.app = self.app
            return cell
        }
        
        if indexPath.item == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: evaluationId, for: indexPath) as! AppDetailEvaluationCell
            cell.app = self.app
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = view.bounds.width
        var height: CGFloat = 170
        
        if indexPath.item == 1 {
            let descriptionCell = AppDetailDescriptionCell(frame: CGRect(x: 0, y: 0, width: width, height: 1000))
            descriptionCell.app = self.app
            descriptionCell.layoutIfNeeded()
            
            let estimateSizeCell = descriptionCell.systemLayoutSizeFitting(CGSize(width: width, height: 1000))
            height = estimateSizeCell.height
        }
        
        if indexPath.item == 2 {
            height = 550
        }
        
        if indexPath.item == 3 {
            height = 280
        }
        
        return .init(width: width, height: height)
    }
}

