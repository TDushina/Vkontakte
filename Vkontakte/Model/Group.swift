//
//  Group.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 24.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import Foundation
import UIKit

class Group: NSObject {
    var nameGroup : String
    var imageGroup: UIImage?
    
    init(nameGroup: String, imageGroup: UIImage?) {
        self.nameGroup = nameGroup
        self.imageGroup = imageGroup
    }
}
