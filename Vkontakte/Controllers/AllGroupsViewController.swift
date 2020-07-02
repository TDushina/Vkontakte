//
//  AllGroupsViewController.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 24.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class AllGroupsViewController: UITableViewController {

    var allGroups = Group.groups
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
    // MARK: - Table view data source

extension AllGroupsViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AllGroupCell
        let group = allGroups[indexPath.row]
        
        cell.allGroupNameView.text = group.nameGroup
        cell.allGroupImageView.image = group.imageGroup

        return cell
    }

}
