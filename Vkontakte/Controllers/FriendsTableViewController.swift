//
//  FriendsTableViewController.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 22.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friends = User.users
        .sorted { (user1, user2) -> Bool in
            return user1.nameUser < user2.nameUser
        }
    
    var sections: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sections = Array(Set(friends.map ({ String($0.nameUser.prefix(1))}))).sorted()
    }
}

// MARK: - Table view data source
extension FriendsTableViewController {
    
    func friendsInSection(_ section: Int) -> [User] {
        let letter = sections[section]
        return friends.filter { $0.nameUser.hasPrefix(letter)}
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendsInSection(section).count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserTableViewCell
        let user = friendsInSection(indexPath.section)[indexPath.row]
        
        cell.userName.text = user.nameUser
        cell.avatarView.imageView.image = user.avatar

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

// кастомный header
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        <#code#>
//    }
    
    // MARK: - Control
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections
    }
    
    // MARK: - Data transfer
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotos" {
            if let controller = segue.destination as? PhotoCollectionViewController,
                let index = tableView.indexPathForSelectedRow?.row {
                    let user = friends[index]
                    controller.photos = user.photoUser
            }
        }
   }
}
