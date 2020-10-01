//
//  AllGroupsViewController.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 24.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class AllGroupsViewController: UITableViewController, UITextFieldDelegate {
//UISearchBarDelegate
    
    lazy var service = VKService()
    
    var allGroups: [Group] = []
    var filteredGroups: [Group] = []
    
    @IBOutlet weak var txtSearchBar: SearchView!
    {
        didSet {
            txtSearchBar.textField.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredGroups = allGroups
        
        service.getGroups(callback: { [weak self] allGroups in
            self?.allGroups = allGroups
            self?.tableView.reloadData()
        })
        
//        service.groupsSearch()
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
//        cell.allGroupImageView.imageView.image = group.imageGroup

        return cell
    }
    
    // MARK: - SearchBar
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText.isEmpty {
//            filteredGroups = allGroups
//        } else {
//            filteredGroups = allGroups.filter {$0.nameGroup.lowercased().contains(searchText.lowercased())}
//        }
//        tableView.reloadData()
//    }
    
    // MARK: - UITextFieldDelegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if txtSearchBar.textField.text!.isEmpty {
            filteredGroups = allGroups
        } else {
            filteredGroups = allGroups.filter {$0.nameGroup.lowercased().contains(String(textField.text!).lowercased())}
        }
        tableView.reloadData()
        return false
    }

}
