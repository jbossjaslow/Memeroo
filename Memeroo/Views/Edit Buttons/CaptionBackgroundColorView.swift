//
//  CaptionBackgroundColorView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/16/20.
//

import SwiftUI

struct CaptionBackgroundColorView: View {
	@EnvironmentObject var meme: Meme
	@State private var blackLevel: Double = 1
	@Binding var currentSubMenu: EditStackSubMenuType
	@Binding var menuHeight: CGFloat
	
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
					blackLevel = meme.captionColor.red
				}
		}
		.padding(.horizontal, 10)
		.frame(height: menuHeight)
		.background(Color.ViewColors.editButtonBackground)
		.offset(y: currentSubMenu == .none ? 0 : -menuHeight)
		.animation(currentSubMenu == .none ? .easeIn : .easeOut)
		.transition(.move(edge: .bottom))
	}
}

struct CaptionBackgroundColorView_Previews: PreviewProvider {
	@State static var subMenu: EditStackSubMenuType = .font
	@State static var menuHeight: CGFloat = 40
	
    static var previews: some View {
        CaptionBackgroundColorView(currentSubMenu: $subMenu,
								   menuHeight: $menuHeight)
			.environmentObject(Meme().TestMeme())
    }
}
