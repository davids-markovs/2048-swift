//
//  EmptyTile.swift
//  2048
//
//  Created by Davids Markovs on 05.04.19.
//  Copyright © 2019 Davids Markovs. All rights reserved.
//

import UIKit

class EmptyTile: UIView {
	var position: Position

	init(position: Position, frame: CGRect) {
		self.position = position
		super.init(frame: frame)
		self.backgroundColor = App.tile(value: nil).color
		self.layer.cornerRadius = Board.radius
	}


	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
