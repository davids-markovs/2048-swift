//
//  Position.swift
//  2048
//
//  Created by Davids Markovs on 05.04.19.
//  Copyright © 2019 Davids Markovs. All rights reserved.
//

import Foundation
import UIKit

struct Position: Equatable {
	static func ==(lhs: Position, rhs: Position) -> Bool {
		return lhs.x == rhs.x && lhs.y == rhs.y
	}

	var x, y: Int
	init(_ x: Int, _ y: Int) {
		(self.x, self.y) = (x, y)
	}

	func ToString() -> String {
		return "(\(x), \(y))"
	}
}
