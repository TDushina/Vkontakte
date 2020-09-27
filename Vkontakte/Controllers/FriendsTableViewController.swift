//
//  FriendsTableViewController.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 22.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating {
    
    lazy var service = VKService()
    
    var friends = User.users
        .sorted { (user1, user2) -> Bool in
            return user1.nameUser < user2.nameUser
        }
    var filteredFriends: [User] = []
    var sections: [String] = []
    var filteredSections: [String] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.getFriends()
        
        filteredFriends = friends
        
        sections = Array(Set(friends.map ({
            String($0.nameUser.prefix(1))
            })
        )).sorted()
        
        filteredSections = Array(Set(filteredFriends.map ({
            String($0.nameUser.prefix(1))
            })
        )).sorted()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      if let indexPath = tableView.indexPathForSelectedRow {
        tableView.deselectRow(at: indexPath, animated: true)
      }
    }
}

// MARK: - Table view data source
extension FriendsTableViewController {
    
    func friendsInSection(_ section: Int) -> [User] {
        let letter = sections[section]
        return friends.filter { $0.nameUser.hasPrefix(letter)}
    }
    
    func friendsInFilteredSections(_ filteredSection: Int) -> [User] {
        let filteredLetter = filteredSections[filteredSection]
        return filteredFriends.filter { $0.nameUser.hasPrefix(filteredLetter)}
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if searchController.isActive {
            return filteredSections.count
        } else {
            return sections.count
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return friendsInFilteredSections(section).count
        } else {
            return friendsInSection(section).count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! UserTableViewCell
        
        let friend = searchController.isActive ? friendsInFilteredSections(indexPath.section)[indexPath.row] : friendsInSection(indexPath.section)[indexPath.row]
        
        cell.userName.text = friend.nameUser
        cell.avatarView.imageView.image = friend.avatar

        return cell
    }
    
    // MARK: - Animation
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
//        let translationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 400, 0)
//        cell.layer.transform = translationTransform
//
//        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseInOut, animations: {
//            cell.layer.transform = CATransform3DIdentity
//        })
        
        let degree: Double = 90
        let rotationAngle = CGFloat(degree * .pi / 180)
        let rotationTransform = CATransform3DMakeRotation(rotationAngle, 0, 1, 0)
        cell.layer.transform = rotationTransform

        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseInOut, animations: {
            cell.layer.transform = CATransform3DIdentity
        })
    }
    
    // MARK: - Header section
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = UIView()
        viewHeader.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.5)
        
        let label = UILabel()
        if searchController.isActive {
            label.text = filteredSections[section]
        } else {
            label.text = sections[section]
        }
        
        label.frame = CGRect(x: 5, y: 5, width: 100, height: 30)
        viewHeader.addSubview(label)
        return viewHeader
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    // MARK: - Control
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if searchController.isActive {
            return filteredSections
        } else {
            return sections
        }
    }

    // MARK: - SearchController
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
        tableView.reloadData()
     }
    
    func filterContentForSearchText(_ searchText: String) {
        if searchText.isEmpty {
            filteredFriends = friends
            filteredSections = sections
        } else {
            filteredFriends = friends.filter { $0.nameUser.lowercased().contains(searchText.lowercased())
            }
            filteredSections = Array(Set(filteredFriends.map ({
                String($0.nameUser.prefix(1))
                })
            )).sorted()
        }
        tableView.reloadData()
    }
    
    // MARK: - Data passing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "showPhotos",
            let indexPath = tableView.indexPathForSelectedRow,
            let controller = segue.destination as? PhotoCollectionViewController
        else { return }
        
        let friend = searchController.isActive ? friendsInFilteredSections(indexPath.section)[indexPath.row] : friendsInSection(indexPath.section)[indexPath.row]
        controller.photos = friend.photoUser
    }
}
