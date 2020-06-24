//
//  ModelGroup.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 24.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import Foundation
import UIKit

class ModelGroup {
    var groups = [Group]()
    
    init() {
        setup()
    }
    
    func setup() {
        let groupBook = Group(nameGroup: "Book", imageGroup: UIImage(named: "book")!)
        let groupCar = Group(nameGroup: "Car", imageGroup: UIImage(named: "car")!)
        let groupCook = Group(nameGroup: "Cook", imageGroup: UIImage(named: "cook")!)
        let groupTravel = Group(nameGroup: "Travel", imageGroup: UIImage(named: "travel")!)
        
        groups.append(groupBook)
        groups.append(groupCar)
        groups.append(groupCook)
        groups.append(groupTravel)
    }
}
