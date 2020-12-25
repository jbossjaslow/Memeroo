//
//  SubmenuButtonStack.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/22/20.
//

import SwiftUI

struct SubmenuButtonStack: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	var body: some View {
		HStack {
			switch viewRouter.currentSubMenu {
				case .font: FontTypeView()
				case .textSize: FontSizeView()
				case .textColor: ColorSelectorView(title: "text",
												   currentColor: $meme.fontColor)
				case .captionBackgroundColor: ColorSelectorView(title: "background",
																currentColor: $meme.captionBackgroundColor)
				case .strokeColor: ColorSelectorView(title: "text stroke",
													 currentColor: $meme.fontStrokeColor)
				default: EmptyView()
			}
		}
		.background(Color.ViewColors.editButtonBackground)
		.onChange(of: viewRouter.currentTab) { _ in
			viewRouter.currentSubMenu = .none
		}
	}
}

struct SubmenuButtonStack_Previews: PreviewProvider {
	static var previews: some View {
		SubmenuButtonStack()
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeCaptionAbove())
	}
}
