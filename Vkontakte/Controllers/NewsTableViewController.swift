//
//  NewsTableViewController.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 06.07.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var news = News.news

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomNewsCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    @IBAction func refresh(_ sender: UIBarButtonItem) {
        
       let backgroundView = UIView()
       backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
       view.addSubview(backgroundView)
       backgroundView.frame = view.bounds
       
       let loadingView = LoadingView()
       backgroundView.addSubview(loadingView)
       loadingView.center = view.center
       loadingView.startAnimation()
       
       DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
           backgroundView.removeFromSuperview()
       }
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
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? CustomNewsCell else { return }
        cell.setPhotoCollectioDelegate(self, for: indexPath.row)
    }
    
    // MARK: - Collection view data source
    enum Constants {
        static let maxCountPhotos = 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let imagesCount = news[collectionView.tag].photoUser.count
        return imagesCount > Constants.maxCountPhotos ? Constants.maxCountPhotos : imagesCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! NewsPhotoCollectionCell
        
        let newsModelImages = news[collectionView.tag]
        let image = news[collectionView.tag].photoUser[indexPath.row]
        cell.photoImageView.image = image
        
        if indexPath.row == Constants.maxCountPhotos - 1 {
            let countHiddenImages = newsModelImages.photoUser.count - Constants.maxCountPhotos
            cell.countLabel.text = "+\(countHiddenImages)"
            cell.conteiterView.isHidden = countHiddenImages == 0
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.bounds.width / 2,
            height: collectionView.bounds.height / 2)
    }
    
}
