//
//  SingleColorBackground.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/21/20.
//

import SwiftUI

struct SingleColorBackground: ViewModifier {
	let color: Color
	
	func body(content: Content) -> some View {
		content
			.background(color.edgesIgnoringSafeArea(.all))
	}
}
