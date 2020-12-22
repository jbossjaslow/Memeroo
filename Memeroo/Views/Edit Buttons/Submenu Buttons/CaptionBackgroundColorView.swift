//
//  CaptionBackgroundColorView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/16/20.
//

import SwiftUI

struct CaptionBackgroundColorView: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@State private var blackLevel: Double = 1
	
	var body: some View {
		HStack {
			meme.captionColor
				.frame(width: 30, height: 30)
				.border(Color.TextColors.defaultTextColor, width: 2)
			
			Slider(value: $blackLevel,
				   in: 0...1.0,
				   step: 0.05)
				.onChange(of: blackLevel) { _ in
					meme.captionColor = Color(red: blackLevel,
											  green: blackLevel,
											  blue: blackLevel)
				}
				.onAppear {
					blackLevel = meme.captionColor.redChannel
				}
		}
		.padding(.horizontal, 10)
		.frame(height: Constants.EditButtons.menuHeight)
		.background(Color.ViewColors.editButtonBackground)
		.offset(y: viewRouter.currentSubMenu == .none ? 0 : -Constants.EditButtons.menuHeight)
		.animation(viewRouter.currentSubMenu == .none ? .easeIn : .easeOut)
		.transition(.move(edge: .bottom))
	}
}

struct CaptionBackgroundColorView_Previews: PreviewProvider {
    static var previews: some View {
        CaptionBackgroundColorView()
			.environmentObject(ViewRouter().setSubMenu(.captionBackgroundColor))
			.environmentObject(Meme().TestMemeCaptionAbove())
    }
}
