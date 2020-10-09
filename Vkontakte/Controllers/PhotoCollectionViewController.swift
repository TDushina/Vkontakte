//
//  PhotosCollectionViewController.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 22.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController {
    
    var photos: [Photo] = []
    
    lazy var service = VKService()
    lazy var session = Session.instance
    lazy var id = String(session.userId ?? 0)
    
    @IBOutlet weak var photoCollection: UICollectionView!
    @IBOutlet weak var likeControl: UIControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.getPhotos(id: id, callback: { [weak self] photos in
            self?.photos = photos
            self?.collectionView.reloadData()
        })
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotoCell
//        cell.photoView.image = photos[indexPath.row]
//        cell.photoView.alpha = 0.5
        
        let photo = photos[indexPath.row]
        guard let url = URL(string: photo.photoUrl[indexPath.row]) else { return UICollectionViewCell() }
        if let data = try? Data(contentsOf: url) {
            cell.photoView.image = UIImage(data: data)
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            let photo = UIImageView(image: photos[indexPath.row])
            
//            let photo = photos[indexPath.row]
//            guard let url = URL(string: photo.photoUrl[indexPath.row]) else { return UICollectionViewCell() }
//            if let data = try? Data(contentsOf: url) {
//                cell.photoView.image = UIImage(data: data)
//            }
        }
    
        // MARK: - Data passing
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard
                segue.identifier == "ShowBigPhoto",
                let detailVC = segue.destination as? BigPhotoViewController
            else { return }
//            detailVC.photos = photos.compactMap { $0 }
            if let selectedIndexPath = collectionView.indexPathsForSelectedItems?.first {
                detailVC.currentIndex = selectedIndexPath.row
            }
        }
    
    // MARK: - Animation
//    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        UIView.animate(withDuration: 0.5) {
//            if let cell = collectionView.cellForItem(at: indexPath) as? PhotoCell {
//                cell.photoView.transform = .init(scaleX: 1.5, y: 1.5)
//                cell.photoView.alpha = 1
//            }
//        }
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
//        UIView.animate(withDuration: 0.5) {
//            if let cell = collectionView.cellForItem(at: indexPath) as? PhotoCell {
//                cell.photoView.transform = .identity
//                cell.photoView.alpha = 0.5
//            }
//        }
//    }
    
}
