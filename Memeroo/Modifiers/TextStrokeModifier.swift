//
//  TextStrokeModifier.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/23/20.
//

import SwiftUI

struct TextStrokeModifier: ViewModifier {
	let caption: Caption
	let color: Color?
	var shadowColor: Color {
		return color ?? caption.strokeColor
	}
	var radius: CGFloat {
		return 1 - caption.strokeWidth //normally 0
	}
	
	func body(content: Content) -> some View {
		
		content
			.shadow(color: shadowColor,
					radius: radius,
					x: caption.strokeWidth,
					y: caption.strokeWidth)
			.shadow(color: shadowColor,
					radius: 0,
					x: -caption.strokeWidth,
					y: caption.strokeWidth)
			.shadow(color: shadowColor,
					radius: 0,
					x: -caption.strokeWidth,
					y: -caption.strokeWidth)
			.shadow(color: shadowColor,
					radius: 0,
					x: caption.strokeWidth,
					y: -caption.strokeWidth)
	}
}
