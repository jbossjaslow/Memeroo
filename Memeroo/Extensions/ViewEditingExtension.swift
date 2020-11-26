//
//  ViewEditingExtention.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/26/20.
//

import SwiftUI

extension View {
	func ableToEndEditing() -> some View {
		self.modifier(canEndEditing())
	}
	
	func unableToEndEditing() -> some View {
		self.modifier(cannotEndEditing())
	}
}

extension UIApplication {
	func endEditing() {
		sendAction(#selector(UIResponder.resignFirstResponder),
				   to: nil,
				   from: nil,
				   for: nil)
	}
}
