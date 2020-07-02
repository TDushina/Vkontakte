//
//  Group.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 24.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import Foundation
import UIKit

struct Group: Equatable {
    var nameGroup: String
    var imageGroup: UIImage?
    
    static let groups: [Group] = [
        Group(nameGroup: "Book", imageGroup: UIImage(named: "book")),
        Group(nameGroup: "Car", imageGroup: UIImage(named: "car")),
        Group(nameGroup: "Cook", imageGroup: UIImage(named: "cook")),
        Group(nameGroup: "Travel", imageGroup: UIImage(named: "travel"))
    ]

}
