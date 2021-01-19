//
//  AddTextStroke.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/23/20.
//

import SwiftUI

extension View {
	func addTextStroke(caption: Caption,
					   _ overrideColor: Color? = nil) -> some View {
		self.modifier(TextStrokeModifier(caption: caption,
										 color: overrideColor))
	}
}
