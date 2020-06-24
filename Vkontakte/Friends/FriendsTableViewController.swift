//
//  FriendsTableViewController.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 22.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var modelUser = ModelUser()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

    // MARK: - Table view data source

extension FriendsTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelUser.users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserTableViewCell
        let user = modelUser.users[indexPath.row]
        
        cell.userName.text = user.nameUser
        cell.userImageView.image = user.imageUser

        return cell
    }
}
