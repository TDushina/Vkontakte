//
//  ModelUser.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 22.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import Foundation
import UIKit

class ModelUser {
    var users = [User]()
    
    init() {
        setup()
    }
    
    func setup() {
        let man1 = User(nameUser: "Иван", imageUser: UIImage(named: "man")!)
        let man2 = User(nameUser: "Пётр", imageUser: UIImage(named: "man")!)
        let woman1 = User(nameUser: "Анна", imageUser: UIImage(named: "woman")!)
        let woman2 = User(nameUser: "Ольга", imageUser: UIImage(named: "woman")!)
        
        users.append(man1)
        users.append(man2)
        users.append(woman1)
        users.append(woman2)
    }
}
