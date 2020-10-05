//
//  User.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 21.06.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

struct User: Decodable {
    var nameUser: String
    var avatarUrl: String
    var photoUrl: Photo?
    
    // MARK: - Decodable
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarUrl = "photo_50"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let firstName = try container.decode(String.self, forKey: .firstName)
        let lastName = try container.decode(String.self, forKey: .lastName)
        self.nameUser = firstName + " " + lastName
        
        self.avatarUrl = try container.decode(String.self, forKey: .avatarUrl)
    }
    
}
