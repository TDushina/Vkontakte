//
//  LocalDataService.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 05.10.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class LocalDataService {
    
    let storeStack = CoreDataStack(modelName: "CoreData")
    
    func saveFriendsLocal(friends: [User]) {
        for friend in friends {
            let context = storeStack.context
            let friendLocal = UserLocalData(context: context)
            friendLocal.name = friend.nameUser
            friendLocal.avatar = friend.avatarUrl
            storeStack.saveContext()
        }
    }
    
    func readFriendsList() -> [UserLocalData] {
        let context = storeStack.context
        return try! context.fetch(UserLocalData.fetchRequest()) as? [UserLocalData] ?? []
    }
    
}
