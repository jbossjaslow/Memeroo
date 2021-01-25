//
//  EditButtonStack.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/23/20.
//

import SwiftUI

struct EditButtonStack: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	var body: some View {
		ZStack(alignment: .bottom) {
			//Submenu
			SubmenuButtonStack()
			
			//Menu
			switch (meme.memeType ?? .captionAbove, viewRouter.currentTab) {
				case (.captionAbove, .background):
					MenuButtonStack(buttonsToShow: [.chooseImage,
													.cropImage])
				case (.freeStyle, .background):
					MenuButtonStack(buttonsToShow: [.chooseImage,
													.cropImage,])
				case (.freeStyle, .caption):
					MenuButtonStack(buttonsToShow: [.addCaption])
				default:
					EmptyView()
			}
		}
		.frame(height: Constants.EditButtons.menuHeight)
	}
}

struct EditButtonStack_Previews: PreviewProvider {
	static var previews: some View {
		EditButtonStack()
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeCaptionAbove())
	}
}
