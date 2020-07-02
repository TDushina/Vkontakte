//
//  FriendsTableViewController.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 22.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var users = User.users

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

    // MARK: - Table view data source

extension FriendsTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserTableViewCell
        let user = users[indexPath.row]
        
        cell.userName.text = user.nameUser
        cell.userImageView.image = user.avatar

        return cell
    }
    
    // передача данных (фото)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? PhotoCollectionViewController, let index = tableView.indexPathForSelectedRow?.row {
            
            let user = users[index]
            controller.photos = user.photoUser

        }
    }
}
