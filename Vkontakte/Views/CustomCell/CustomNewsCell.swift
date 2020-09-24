//
//  CustomNewsCell.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 06.07.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class CustomNewsCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: AvatarView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postDataLabel: UILabel!
    @IBOutlet weak var textNewsLabel: UILabel!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    
    func configure(model: News) {
        avatarImageView.imageView.image = model.avatar
        userNameLabel.text = model.nameUser
        postDataLabel.text = model.postDate
        textNewsLabel.text = model.text
        
        photoCollectionView.register(UINib(nibName: "NewsPhotoCollectionCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
    }
    
    func setPhotoCollectioDelegate(_ delegate: UICollectionViewDataSource & UICollectionViewDelegate, for row: Int) {
        photoCollectionView.dataSource = delegate
        photoCollectionView.delegate = delegate
        photoCollectionView.tag = row
        photoCollectionView.reloadData()
    }
    
}
