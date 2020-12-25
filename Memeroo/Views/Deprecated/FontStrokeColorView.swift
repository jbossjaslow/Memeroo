//
//  FontStrokeColorView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/22/20.
//

import SwiftUI

struct FontStrokeColorView: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(spacing: 15) {
				Image(systemName: "square.split.diagonal.2x2")
					.resizable()
					.foregroundColor(.red)
					.frame(width: 30, height: 30)
					.border(Color.TextColors.defaultTextColor, width: 2)
					.onTapGesture {
						meme.fontStrokeColor = .clear
					}
				
				ForEach(Color.TextColors.colorsList) { color in
					color
						.frame(width: 30, height: 30)
						.border(Color.TextColors.defaultTextColor, width: 2)
						.onTapGesture {
							meme.fontStrokeColor = color
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

struct FontStrokeColorView_Previews: PreviewProvider {
    static var previews: some View {
        FontStrokeColorView()
			.environmentObject(ViewRouter().setSubMenu(.strokeColor))
			.environmentObject(Meme().TestMemeCaptionAbove())
    }
}
