//
//  NewsTableViewController.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 06.07.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {

    var news = News.news

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomNewsCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomNewsCell
        cell.configure(model: news[indexPath.row])
        return cell
    }
    
}
