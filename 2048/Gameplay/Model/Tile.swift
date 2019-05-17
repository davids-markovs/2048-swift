//
//  Tile.swift
//  2048
//
//  Created by Davids Markovs on 05.04.19.
//  Copyright © 2019 Davids Markovs. All rights reserved.
//

import Foundation
import UIKit

class Tile {
	let position: Position
	var value: Int?

	weak var upTile: Tile?
	weak var rightTile: Tile?
	weak var bottomTile: Tile?
	weak var leftTile: Tile?

	init(position: Position, value: Int? = nil) {
		self.position = position
		self.value = value
	}
}
