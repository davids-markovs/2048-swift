//
//  TileModel+CoreDataProperties.swift
//  2048
//
//  Created by Davids Markovs on 05.04.19.
//  Copyright © 2019 Davids Markovs. All rights reserved.
//
//

import Foundation
import CoreData


extension TileModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TileModel> {
        return NSFetchRequest<TileModel>(entityName: "TileModel")
    }

    @NSManaged public var positionX: Int16
    @NSManaged public var tileValue: Int32
    @NSManaged public var positionY: Int16

}
