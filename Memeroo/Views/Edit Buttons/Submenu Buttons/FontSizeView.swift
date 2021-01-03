//
//  FontSizeView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/16/20.
//

import SwiftUI

struct FontSizeView: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	var body: some View {
		HStack {
			Text("\(Int(meme.fontSize))")
			
			Slider(value: $meme.fontSize,
				   in: 8...54,
				   step: 2)
		}
		.padding(.horizontal, 10)
		.frame(height: Constants.EditButtons.menuHeight)
		.background(Color.ViewColors.editButtonBackground)
		.offset(y: viewRouter.currentSubMenu == .none ? 0 : -Constants.EditButtons.menuHeight)
		.animation(viewRouter.currentSubMenu == .none ? .easeIn : .easeOut)
		.transition(.move(edge: .bottom))
	}
}

struct FontSizeView_Previews: PreviewProvider {
	
    static var previews: some View {
        FontSizeView()
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeCaptionAbove())
    }
}
