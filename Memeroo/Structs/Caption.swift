//
//  Caption.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/23/20.
//

import CoreGraphics

struct Caption: Hashable {
	var text: String
	var offset: CGSize
	
	init(_ text: String) {
		self.text = text
		offset = .zero
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(text)
	}
}
