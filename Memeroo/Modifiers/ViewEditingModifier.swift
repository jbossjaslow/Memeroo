//
//  ViewEditingModifier.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/26/20.
//

import SwiftUI

/// Used to trigger an end editing call for any active text fields
struct canEndEditing: ViewModifier {
	func body(content: Content) -> some View {
		content
			//			.contentShape(Rectangle()) //May be necessary in some scenarios
			.onTapGesture {
				UIApplication.shared.endEditing()
			}
	}
}

struct runOnSpacerTapModifier: ViewModifier {
	
	var completion: () -> Void
	
	init(_ completion: @escaping () -> Void) {
		self.completion = completion
	}
	
	func body(content: Content) -> some View {
		content
			.onTapGesture {
				completion()
			}
	}
}

/// Used whenever the view must not stop editing, since the `canEndEditing` modifier will be passed down to all children
struct cannotEndEditing: ViewModifier {
	func body(content: Content) -> some View {
		content.onTapGesture {
			//do nothing
		}
	}
}
