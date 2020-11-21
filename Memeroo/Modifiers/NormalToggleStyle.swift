//
//  NormalToggleStyle.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/21/20.
//

import SwiftUI

struct NormalToggleStyle<S: Shape>: ToggleStyle {
	@EnvironmentObject var viewRouter: ViewRouter
	
	var colorTheme: Color
	var shape: S
	@State var tabType: TabType = .background
	
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.padding(5)
			.contentShape(shape)
			.background(
				Background(isHighlighted: viewRouter.currentView == tabType,
						   shape: shape,
						   colorTheme: colorTheme)
			)
			.onTapGesture {
				viewRouter.currentView = tabType
			}
	}
	
	private struct Background<S: Shape>: View {
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

				} else {
					shape
						.fill(colorTheme)
						.overlay(shape.stroke(LinearGradient(colorTheme.offLight, colorTheme.offDark),
											  lineWidth: 4))
				}
			}
		}
	}
}
