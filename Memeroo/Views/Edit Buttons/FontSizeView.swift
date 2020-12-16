//
//  FontSizeView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/16/20.
//

import SwiftUI

struct FontSizeView: View {
	@EnvironmentObject var meme: Meme
	@Binding var currentSubMenu: EditStackSubMenuType
	@Binding var menuHeight: CGFloat
	
	var body: some View {
		HStack {
			Text("\(Int(meme.fontSize))")
			
			Slider(value: $meme.fontSize,
				   in: 8...54,
				   step: 2)
		}
		.padding(.horizontal, 10)
		.frame(height: menuHeight)
		.background(Color.ViewColors.editButtonBackground)
		.offset(y: currentSubMenu == .none ? 0 : -menuHeight)
		.animation(currentSubMenu == .none ? .easeIn : .easeOut)
		.transition(.move(edge: .bottom))
	}
}

struct FontSizeView_Previews: PreviewProvider {
	@State static var subMenu: EditStackSubMenuType = .size
	@State static var menuHeight: CGFloat = 40
	
    static var previews: some View {
        FontSizeView(currentSubMenu: $subMenu,
					 menuHeight: $menuHeight)
			.environmentObject(Meme().TestMeme())
    }
}
