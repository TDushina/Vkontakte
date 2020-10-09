//
//  UserLocalData+CoreDataProperties.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 05.10.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//
//

import Foundation
import CoreData


extension UserLocalData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserLocalData> {
        return NSFetchRequest<UserLocalData>(entityName: "UserLocalData")
    }

    @NSManaged public var name: String?
    @NSManaged public var avatar: String?

}

extension UserLocalData : Identifiable {

}
