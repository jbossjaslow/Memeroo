//
//  AddTextStroke.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/23/20.
//

import SwiftUI

extension View {
	func addTextStroke(text: String) -> some View {
		self.modifier(TextStrokeModifier(text: text))
	}
}
