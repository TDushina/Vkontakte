//
//  Session.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 25.09.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import Foundation

class Session {
    
    static let instance = Session()
    
    var token: String?
    var userId: Int?
    
    private init() {}
    
}
