//
//  Colors.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/24/20.
//

import SwiftUI

extension Color {
	struct TextColors {
		static let colorsList = [
			black,
			blue,
			brown,
			cyan,
			green,
			magenta,
			orange,
			purple,
			red,
			white,
			yellow
		]
		
		static let black = Color("TextColor - Black")
		static let blue = Color("TextColor - Blue")
		static let brown = Color("TextColor - Brown")
		static let cyan = Color("TextColor - Cyan")
		static let green = Color("TextColor - Green")
		static let magenta = Color("TextColor - Magenta")
		static let orange = Color("TextColor - Orange")
		static let purple = Color("TextColor - Purple")
		static let red = Color("TextColor - Red")
		static let white = Color("TextColor - White")
		static let yellow = Color("TextColor - Yellow")
		
		static let defaultTextColor = Color("Default Text Color")
	}
	
	struct CaptionColor {
		
	}
}

extension Color: Identifiable {
	public var id: UUID {
		return UUID()
	}
}
