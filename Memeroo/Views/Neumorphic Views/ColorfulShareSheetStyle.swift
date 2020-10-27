//
//  ColorfulShareSheetStyle.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/27/20.
//

import SwiftUI

struct ColorfulShareSheetStyle<S: Shape>: ButtonStyle {
	var shape: S
	var colorTheme: Color
	
	func makeBody(configuration: Self.Configuration) -> some View {
		configuration.label
			.animation(nil)
			.padding(10)
			.contentShape(shape)
			.animation(.easeOut)
			.background(
				ColorfulBackground(isHighlighted: configuration.isPressed,
								   shape: shape,
								   colorTheme: colorTheme)
			)
	}
}
