//
//  EditCaptionButtonsModifier.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/26/20.
//

import SwiftUI

struct EditCaptionButtonsModifier: ViewModifier {
	private var color: Color = .white
	
	init(_ color: Color = .white) {
		self.color = color
	}
	
	func body(content: Content) -> some View {
		content
			.foregroundColor(color)
			.frame(height: 50)
			.padding(.horizontal)
			.background(Color.black.opacity(0.5))
			.cornerRadius(5)
	}
}
