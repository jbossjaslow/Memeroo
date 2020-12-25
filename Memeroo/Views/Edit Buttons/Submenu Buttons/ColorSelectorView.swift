//
//  ColorSelectorView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/24/20.
//

import SwiftUI

struct ColorSelectorView: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@State var title: String = ""
	@Binding var currentColor: Color
	
    var body: some View {
		ColorPicker("Change \(title) color",
					selection: $currentColor)
		.padding(.horizontal, 10)
		.frame(height: Constants.EditButtons.menuHeight)
		.background(Color.ViewColors.editButtonBackground)
		.offset(y: viewRouter.currentSubMenu == .none ? 0 : -Constants.EditButtons.menuHeight)
		.animation(viewRouter.currentSubMenu == .none ? .easeIn : .easeOut)
		.transition(.move(edge: .bottom))
    }
}

struct ColorSelectorView_Previews: PreviewProvider {
	@State static var color: Color = .green
	
    static var previews: some View {
		ColorSelectorView(currentColor: $color)
			.environmentObject(ViewRouter().setSubMenu(.textColor))
			.environmentObject(Meme().TestMemeFreeText())
	}
}
