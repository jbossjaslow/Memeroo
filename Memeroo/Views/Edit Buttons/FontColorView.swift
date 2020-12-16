//
//  FontColorView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/16/20.
//

import SwiftUI

struct FontColorView: View {
	@EnvironmentObject var meme: Meme
	@Binding var currentSubMenu: EditStackSubMenuType
	@Binding var menuHeight: CGFloat
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(spacing: 15) {
				ForEach(Color.TextColors.colorsList) { color in
					color
						.frame(width: 30, height: 30)
						.border(Color.TextColors.defaultTextColor, width: 2)
						.onTapGesture {
							meme.fontColor = color
						}
				}
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

struct FontColorView_Previews: PreviewProvider {
	@State static var subMenu: EditStackSubMenuType = .font
	@State static var menuHeight: CGFloat = 40
	
    static var previews: some View {
        FontColorView(currentSubMenu: $subMenu,
					  menuHeight: $menuHeight)
			.environmentObject(Meme().TestMeme())
    }
}
