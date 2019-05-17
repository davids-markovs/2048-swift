//
//  TileModel+CoreDataClass.swift
//  2048
//
//  Created by Davids Markovs on 05.04.19.
//  Copyright © 2019 Davids Markovs. All rights reserved.
//
//

import Foundation
import CoreData

@objc(TileModel)
public class TileModel: NSManagedObject {
	var upTile: Tile?
	var rightTile: Tile?
	var bottomTile: Tile?
	var leftTile: Tile?
}
