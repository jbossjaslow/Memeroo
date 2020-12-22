//
//  EditCaptionButtonsStyle.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/26/20.
//

import SwiftUI

extension View {
	func editCaptionButtonsStyle(_ color: Color = .white) -> some View {
		return modifier(EditCaptionButtonsModifier(color))
	}
}
