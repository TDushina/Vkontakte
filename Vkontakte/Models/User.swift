//
//  User.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 21.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import Foundation
import UIKit

struct User {
    var nameUser: String
    var avatar: UIImage?
    var photoUser: [UIImage?]
    
    static let users: [User] = [
        User(nameUser: "Иван",
             avatar: UIImage(named: "man"),
             photoUser: [
                UIImage(named: "photo0"),
                UIImage(named: "photo1"),
                UIImage(named: "photo2"),
                UIImage(named: "photo3")]),
        User(nameUser: "Пётр",
             avatar: UIImage(named: "man"),
             photoUser: [
                 UIImage(named: "photo2"),
                 UIImage(named: "photo3"),
                 UIImage(named: "photo4")]),
        User(nameUser: "Анна",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo2"),
                 UIImage(named: "photo3"),
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5")]),
        User(nameUser: "Ольга",
             avatar: UIImage(named: "woman"),
             photoUser: [
                 UIImage(named: "photo4"),
                 UIImage(named: "photo5"),
                 UIImage(named: "photo6")])
    ]
 
}
