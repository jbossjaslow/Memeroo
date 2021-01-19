//
//  CaptionEditButtonsModifier.swift
//  Memeroo
//
//  Created by Josh Jaslow on 1/18/21.
//

import SwiftUI

struct CaptionsEditButtonsModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(height: Constants.EditButtons.menuHeight)
			.padding(10)
			.background(
				RoundedRectangle(cornerRadius: 10)
					.stroke(Color.black, lineWidth: 2)
			)
			.background(Color.ViewColors.editButtonBackground)
			.cornerRadius(10)
	}
}
