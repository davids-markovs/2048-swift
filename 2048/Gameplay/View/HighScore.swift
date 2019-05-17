//
//  HighScore.swift
//  2048
//
//  Created by Davids Markovs on 05.04.19.
//  Copyright © 2019 Davids Markovs. All rights reserved.
//

import Foundation
import UIKit

class HighScore: Score {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.label.text = "High Score"
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("coder isn't allowed")
	}
}
