//
//  NewsPhotoCollectionCell.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 08.07.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class NewsPhotoCollectionCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var conteiterView: UIView!
    @IBOutlet weak var countLabel: UILabel!
    
    // вызывается до того, как ячейка переиспользуется
    // скрываем контейнер
    override func prepareForReuse() {
        super.prepareForReuse()
        conteiterView.isHidden = true
    }
}
