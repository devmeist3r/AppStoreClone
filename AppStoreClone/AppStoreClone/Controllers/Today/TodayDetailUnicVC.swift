//
//  TodayDetailUnicVC.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 21/05/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class TodayDetailUnicVC: UITableViewController {
    
    let cellId = "cellId"
    
    var todayApp: TodayApp?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(TodayDetailUnicCell.self, forCellReuseIdentifier: cellId)
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        
        self.addHeader()
        
    }
    
    func addHeader() {
        let headerView = UIView(frame: .init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.width + 48))
        
        let todayCell = TodayCell()
        todayCell.todayApp = self.todayApp
        todayCell.layer.cornerRadius = 0
        
        headerView.addSubview(todayCell)
        todayCell.fillSuperview()
        
        self.tableView.tableHeaderView = headerView
    }
    
}

extension TodayDetailUnicVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TodayDetailUnicCell
        return cell
    }
}
