//
//  ColorfulBackground.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/27/20.
//

import SwiftUI

struct ColorfulBackground<S: Shape>: View {
	//Protocol 'Shape' can only be used as a generic constraint because it has Self or associated type requirements
	var isHighlighted: Bool
	var shape: S
	var colorTheme: Color
	
	var body: some View {
		ZStack {
			if isHighlighted { //pressed in
				shape
					.fill(LinearGradient(colorTheme.offDark, colorTheme.offLight))
					.overlay(shape.stroke(LinearGradient(colorTheme.offLight, colorTheme.offDark),
										  lineWidth: 4))
					.shadow(color: colorTheme.offLight, radius: 10, x: 5, y: 5)
					.shadow(color: colorTheme.offDark, radius: 10, x: -5, y: -5)

			} else {
				shape
					.fill(colorTheme)
//					.overlay(shape.stroke(LinearGradient(Color.myPink.offLight, Color.myPink.offDark),
//										  lineWidth: 7))
					.shadow(color: colorTheme.offLight, radius: 10, x: -10, y: -10)
					.shadow(color: colorTheme.offDark, radius: 10, x: 10, y: 10)
			}
		}
	}
}
