//
//  TodayDetailVC.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 17/05/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class TodayDetailVC: UIViewController {
    
    let closeButton: UIButton = .closeButton()
    
    var centerView: UIView?
    var frame: CGRect?
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    let todayDetailUnicVC = TodayDetailUnicVC()
    
    var handlerClose: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
    }
    
    func addButtonClose() {
        view.addSubview(closeButton)
        
        closeButton.alpha = 0
        closeButton.addTarget(self, action: #selector(handleCloseClick), for: .touchUpInside)
        closeButton.fill(top: self.view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 18, left: 0, bottom: 0, right: 24), size: .init(width: 32, height: 32))
        
        UIView.animate(withDuration: 0.3, delay: 0.2, options: .showHideTransitionViews, animations: { self.closeButton.alpha = 1 }, completion: nil)
    }
    
    func addUnic() {
        self.centerView = todayDetailUnicVC.view
        self.animation()
    }
    
    func animation() {
        guard let centerView = self.centerView else { return }
        guard let frame = self.frame else { return }
        
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.layer.cornerRadius = 16
        centerView.clipsToBounds = true
        
        view.addSubview(centerView)
        self.addButtonClose()
        
        self.topConstraint = centerView.topAnchor.constraint(equalTo: view.topAnchor, constant: frame.origin.y)
        self.leadingConstraint = centerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: frame.origin.x)
        self.widthConstraint = centerView.widthAnchor.constraint(equalToConstant: frame.width)
        self.heightConstraint = centerView.heightAnchor.constraint(equalToConstant: frame.height)
        
        self.topConstraint?.isActive = true
        self.leadingConstraint?.isActive = true
        self.widthConstraint?.isActive = true
        self.heightConstraint?.isActive = true
        
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .overrideInheritedCurve, animations: {
            
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    @objc func handleCloseClick() {
        self.handlerClose?()
        
        self.dismiss(animated: true, completion: nil)
    }
}
