//
//  EditCaptionButtonsModifier.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/26/20.
//

import SwiftUI

struct EditCaptionButtonsModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.foregroundColor(.white)
			.frame(height: 50)
			.padding(.horizontal)
			.background(Color.black.opacity(0.5))
			.cornerRadius(5)
	}
}
