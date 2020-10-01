//
//  VKResponse.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 30.09.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import UIKit

class VKResponse <T: Decodable>: Decodable {
    var count: Int
    let items: [T]
    
    enum CodingKeys: String, CodingKey {
        case response
        case count
        case items
    }
    
    required init(from decoder: Decoder) throws {
        let topContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        let container = try topContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .response)
        
        self.count = try container.decode(Int.self, forKey: .count)
        self.items = try container.decode([T].self, forKey: .items)
    }
    
}

