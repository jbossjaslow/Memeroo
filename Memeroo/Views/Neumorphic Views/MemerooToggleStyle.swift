//
//  MemerooToggleStyle.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/27/20.
//

import SwiftUI

struct MemerooToggleStyle<S: Shape>: ToggleStyle {
	@EnvironmentObject var viewRouter: ViewRouter
	
	var colorTheme: Color
	var shape: S
	@State var tabType: TabType = .background
	
	func makeBody(configuration: Self.Configuration) -> some View {
		configuration.label
			.padding(5)
			.contentShape(shape)
			.background(
				ColorfulBackground(isHighlighted: viewRouter.currentTab == tabType,
								   shape: shape,
								   colorTheme: colorTheme)
			)
			.onTapGesture {
				viewRouter.currentTab = tabType
			}
	}
}
