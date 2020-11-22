//
//  SingleColorBackground.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/22/20.
//

import SwiftUI

extension View {
	func singleColorBackground(color: Color) -> some View {
		return modifier(SingleColorBackground(color: color))
	}
}
