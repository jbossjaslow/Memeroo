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
	
	func body(content: Content) -> some View {
		
		content
			.shadow(color: meme.fontStrokeColor,
					radius: 0, x: 1, y: 1)
			.shadow(color: meme.fontStrokeColor,
					radius: 0, x: -1, y: 1)
			.shadow(color: meme.fontStrokeColor,
					radius: 0, x: -1, y: -1)
			.shadow(color: meme.fontStrokeColor,
					radius: 0, x: 1, y: -1)
	}
}
