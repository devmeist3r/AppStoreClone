//
//  TodayDetailUnicVC.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 21/05/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class TodayDetailUnicVC: UITableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .white
        self.addHeader()
    }
    
    func addHeader() {
        let headerView = UIView(frame: .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width + 48))
        
        let todayCell = TodayCell()
        todayCell.layer.cornerRadius = 0
        
        headerView.addSubview(todayCell)
        todayCell.fillSuperview()
        
        self.tableView.tableHeaderView = headerView
    }
    
}
