//
//  PhotoLocalData+CoreDataProperties.swift
//  Vkontakte
//
//  Created by Татьяна Душина on 09.10.2020.
//  Copyright © 2020 Татьяна Душина. All rights reserved.
//
//

import Foundation
import CoreData


extension PhotoLocalData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhotoLocalData> {
        return NSFetchRequest<PhotoLocalData>(entityName: "PhotoLocalData")
    }

    @NSManaged public var imageUrl: String?

}

extension PhotoLocalData : Identifiable {

}
