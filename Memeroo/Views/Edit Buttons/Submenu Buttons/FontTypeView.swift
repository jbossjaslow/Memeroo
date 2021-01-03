//
//  FontTypeView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/16/20.
//

import SwiftUI

struct FontTypeView: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
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
		.frame(height: Constants.EditButtons.menuHeight)
		.background(Color.ViewColors.editButtonBackground)
		.offset(y: viewRouter.currentSubMenu == .none ? 0 : -Constants.EditButtons.menuHeight)
		.animation(viewRouter.currentSubMenu == .none ? .easeIn : .easeOut)
		.transition(.move(edge: .bottom))
	}
}

struct FontTypeView_Previews: PreviewProvider {
	
    static var previews: some View {
		FontTypeView()
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeCaptionAbove())
    }
}
