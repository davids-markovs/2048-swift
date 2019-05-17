//
//  CGPointExtension.swift
//  2048
//
//  Created by Davids Markovs on 05.04.19.
//  Copyright © 2019 Davids Markovs. All rights reserved.
//

import Foundation
import UIKit

extension CGPoint {
	static func +(one: CGPoint, other: CGPoint) -> CGPoint {
		return CGPoint(x: one.x + other.x, y: one.y + other.y)
	}

	static func -(one: CGPoint, other: CGPoint) -> CGPoint {
		return CGPoint(x: one.x - other.x, y: one.y - other.y)
	}
}
