//
//  AllGroupsViewController.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 24.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class AllGroupsViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var allGroups = Group.groups
    var filteredGroups: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredGroups = allGroups
    }
}
    // MARK: - Table view data source

extension AllGroupsViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AllGroupCell
        let group = filteredGroups[indexPath.row]
        
        cell.allGroupNameView.text = group.nameGroup
        cell.allGroupImageView.image = group.imageGroup

        return cell
    }
    
    // MARK: - SearchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredGroups = allGroups
        } else {
            filteredGroups = allGroups.filter {$0.nameGroup.lowercased().contains(searchText.lowercased())}
        }
        tableView.reloadData()
    }

}
