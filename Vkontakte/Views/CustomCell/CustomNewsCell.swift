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
    }
    
}
