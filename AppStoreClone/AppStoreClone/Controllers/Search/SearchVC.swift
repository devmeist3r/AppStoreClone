//
//  SearchVC.swift
//  AppStoreClone
//
//  Created by Lucas Inocencio on 20/04/20.
//  Copyright © 2020 Lucas Inocencio. All rights reserved.
//

import UIKit

class SearchVC: UITableViewController, UISearchBarDelegate {
    
    let cellId = "cellId"
    let searchController = UISearchController(searchResultsController: nil)
    var apps: [App] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        tableView.register(SearchCell.self, forCellReuseIdentifier: cellId)
        self.configureSearchBar()
    }
    
    func configureSearchBar() {
        navigationItem.searchController = searchController
        
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Jogos, Apps, Artigos e Mais"
        self.searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchApp(text: searchText)
    }
}

extension SearchVC {
    func searchApp (text: String) {
        SearchService.shared.getApps(text: text) { (apps, err) in
            if let apps = apps {
                DispatchQueue.main.async {
                    self.apps = apps
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension SearchVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apps.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SearchCell
        cell.app = self.apps[indexPath.item]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .init(tableView.bounds.width * 0.8)
    }
}
