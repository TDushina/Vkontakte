//
//  Photo.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 01.10.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import Foundation

class Photo: Decodable {
    dynamic var photoUrl: [String]

    // MARK: - Decodable
    enum CodingKeys: String, CodingKey {
        case sizes
    }
    
    enum SizeKeys: String, CodingKey {
        case photoUrl = "url"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let sizesValues = try container.nestedContainer(keyedBy: SizeKeys.self, forKey: .sizes)
        self.photoUrl = try sizesValues.decode([String].self, forKey: .photoUrl)
    }
    
}
