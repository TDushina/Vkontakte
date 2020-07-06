//
//  FriendsTableViewController.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 22.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController, UISearchBarDelegate  {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var friends = User.users
        .sorted { (user1, user2) -> Bool in
            return user1.nameUser < user2.nameUser
        }
    
    var filteredFriends: [User] = []
    
    var sections: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredFriends = friends
        
        sections = Array(Set(filteredFriends.map ({
            String($0.nameUser.prefix(1))
            })
        )).sorted()
    }
}

// MARK: - Table view data source
extension FriendsTableViewController {
    
    func friendsInSection(_ section: Int) -> [User] {
        let letter = sections[section]
        return filteredFriends.filter { $0.nameUser.hasPrefix(letter)}
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
    
    // MARK: - Header section
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = UIView()
        viewHeader.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.5)
        
        let label = UILabel()
        label.text = sections[section]
        label.frame = CGRect(x: 5, y: 5, width: 100, height: 30)
        
        viewHeader.addSubview(label)
        
        return viewHeader
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    // MARK: - Control
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections
    }
    
    // MARK: - SearchBar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredFriends = friends
        } else {
            filteredFriends = friends.filter { $0.nameUser.lowercased().contains(searchText.lowercased())
            }
            
            sections = Array(Set(filteredFriends.map ({
                String($0.nameUser.prefix(1))
                })
            )).sorted()
        }
        tableView.reloadData()
    }
    
    // MARK: - Data passing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotos" {
            if let controller = segue.destination as? PhotoCollectionViewController,
                let index = tableView.indexPathForSelectedRow?.row {
                    let user = filteredFriends[index]
                controller.photos = user.photoUser
            }
        }
   }
}
