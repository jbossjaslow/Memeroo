//
//  FontTypeView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/16/20.
//

import SwiftUI

struct FontTypeView: View {
	@EnvironmentObject var meme: Meme
	@Binding var currentSubMenu: EditStackSubMenuType
	@Binding var menuHeight: CGFloat
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(spacing: 15) {
				Divider()
					.background(Color.TextColors.defaultTextColor)
				
				ForEach(values: Fonts.allFontFamilies) { font in
					Group {
						Text(font)
							.font(.custom(font, size: 12))
							.foregroundColor(Color.TextColors.defaultTextColor)
							.onTapGesture {
								meme.fontFamily = font
							}
						
						Divider()
							.background(Color.TextColors.defaultTextColor)
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

struct FontTypeView_Previews: PreviewProvider {
	@State static var subMenu: EditStackSubMenuType = .font
	@State static var menuHeight: CGFloat = 40
	
    static var previews: some View {
		FontTypeView(currentSubMenu: $subMenu,
					 menuHeight: $menuHeight)
			.environmentObject(Meme().TestMeme())
    }
}
