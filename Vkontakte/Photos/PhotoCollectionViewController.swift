//
//  PhotosCollectionViewController.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 22.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController {
    
    var photos = [UIImage]()
    
    @IBOutlet weak var photoCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...6 {
            let photo = UIImage(named: "photo\(i)")!
            photos.append(photo)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotoCell
        let photo = photos[indexPath.item]
        cell.photoView.image = photo
        
        return cell
    }
}
