//
//  File.swift
//  Memeroo
//
//  Created by Josh Jaslow on 1/18/21.
//

import SwiftUI

extension View {
	func CaptionEditButtonsHStackModifier() -> some View {
		self.modifier(CaptionsEditButtonsModifier())
	}
}
