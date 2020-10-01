//
//  Group.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 24.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import Foundation
import UIKit

class Group: Decodable {
    dynamic var nameGroup: String
    dynamic var imageGroupUrl: String
    
    // MARK: - Decodable
    enum CodingKeys: String, CodingKey {
        case nameGroup = "name"
        case imageGroupUrl = "photo_50"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.nameGroup = try container.decode(String.self, forKey: .nameGroup)
        self.imageGroupUrl = try container.decode(String.self, forKey: .imageGroupUrl)
    }

}



// MARK: - FAKE
struct GroupFake: Equatable {
    var nameGroup: String
    var imageGroup: UIImage?
    
    static let groups: [GroupFake] = [
        GroupFake(nameGroup: "Book", imageGroup: UIImage(named: "book")),
        GroupFake(nameGroup: "Car", imageGroup: UIImage(named: "car")),
        GroupFake(nameGroup: "Cook", imageGroup: UIImage(named: "cook")),
        GroupFake(nameGroup: "Travel", imageGroup: UIImage(named: "travel"))
    ]

}
