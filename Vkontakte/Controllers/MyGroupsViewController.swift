//
//  MyGroupsViewController.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 24.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class MyGroupsViewController: UITableViewController {
    
    lazy var service = VKService()
    
    var myGroup: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.getGroups()
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        guard
        let allGroupController = segue.source as? AllGroupsViewController,
        let indexPath = allGroupController.tableView.indexPathForSelectedRow
        else { return }
        
        let group = allGroupController.filteredGroups[indexPath.row]
        
        guard !myGroup.contains(group) else {return}
        myGroup.append(group)
        tableView.reloadData()
    }
        
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroup.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyGroupCell
        let tmpGroup = myGroup[indexPath.row]
        
        cell.myGroupNameView.text = tmpGroup.nameGroup
        cell.myGroupImageView.imageView.image = tmpGroup.imageGroup

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myGroup.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
