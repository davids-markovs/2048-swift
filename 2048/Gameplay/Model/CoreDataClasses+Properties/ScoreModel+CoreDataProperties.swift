//
//  ScoreModel+CoreDataProperties.swift
//  2048
//
//  Created by Davids Markovs on 05.04.19.
//  Copyright © 2019 Davids Markovs. All rights reserved.
//
//

import Foundation
import CoreData


extension ScoreModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScoreModel> {
        return NSFetchRequest<ScoreModel>(entityName: "ScoreModel")
    }

    @NSManaged public var value: Int64

}
