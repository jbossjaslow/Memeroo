//
//  CGSizeOperatorOverload.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/22/20.
//

import CoreGraphics

extension CGSize {
	static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
		let width = lhs.width + rhs.width
		let height = lhs.height + rhs.height
		return .init(width: width, height: height)
	}
	
	static func += (lhs: inout CGSize, rhs: CGSize) {
		lhs.width += rhs.width
		lhs.height += rhs.height
	}
}
