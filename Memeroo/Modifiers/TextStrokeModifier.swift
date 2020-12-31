//
//  TextStrokeModifier.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/23/20.
//

import SwiftUI

struct TextStrokeModifier: ViewModifier {
	@EnvironmentObject var meme: Meme
	
	let text: String
	let color: Color?
	var shadowColor: Color {
		return color ?? meme.fontStrokeColor
	}
	var radius: CGFloat {
		return 1 - meme.fontStrokeWidth //normally 0
	}
	
	func body(content: Content) -> some View {
		
		content
			.shadow(color: shadowColor,
					radius: radius,
					x: meme.fontStrokeWidth,
					y: meme.fontStrokeWidth)
			.shadow(color: shadowColor,
					radius: 0,
					x: -meme.fontStrokeWidth,
					y: meme.fontStrokeWidth)
			.shadow(color: shadowColor,
					radius: 0,
					x: -meme.fontStrokeWidth,
					y: -meme.fontStrokeWidth)
			.shadow(color: shadowColor,
					radius: 0,
					x: meme.fontStrokeWidth,
					y: -meme.fontStrokeWidth)
	}
}
