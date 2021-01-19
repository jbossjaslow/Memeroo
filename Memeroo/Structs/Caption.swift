//
//  Caption.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/23/20.
//

import CoreGraphics
import SwiftUI

struct Caption: Hashable {
	var text: String
	var offset: CGSize
	var fontSize: CGFloat
	var fontColor: Color
	var strokeColor: Color
	var strokeWidth: CGFloat
	var fontFamily: String
	var backgroundColor: Color
	
	init(_ text: String,
		 size: CGFloat = 14,
		 fontColor: Color = .black,
		 strokeColor: Color = .clear,
		 strokeWidth: CGFloat = 1,
		 fontFamily: String = "system",
		 backgroundColor: Color = .white) {
		self.text = text
		offset = .zero
		fontSize = size
		self.fontColor = fontColor
		self.strokeColor = strokeColor
		self.strokeWidth = strokeWidth
		self.fontFamily = fontFamily
		self.backgroundColor = backgroundColor
	}
	
	static func defaultCaption() -> Self {
		return Self(Constants.Text.defaultCaptionText,
					size: Constants.FontSize.defaultFontSize)
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(text)
	}
}
