//
//  ViewEditingModifier.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/26/20.
//

import SwiftUI

struct canEndEditing: ViewModifier {
	func body(content: Content) -> some View {
		content
//			.contentShape(Rectangle()) //May be necessary in some scenarios
			.onTapGesture {
			UIApplication.shared.endEditing()
			}
	}
}

//used whenever the view must not stop editing, since the `canEndEditing` modifier will be passed down to all children
struct cannotEndEditing: ViewModifier {
	func body(content: Content) -> some View {
		content.onTapGesture {
			//do nothing
		}
	}
}
