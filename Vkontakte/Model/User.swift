//
//  User.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 21.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import Foundation
import UIKit

class User: NSObject {
    var nameUser: String
    var imageUser: UIImage?
    
    init(nameUser: String, imageUser: UIImage?) {
        self.nameUser = nameUser
        self.imageUser = imageUser
    }
}
