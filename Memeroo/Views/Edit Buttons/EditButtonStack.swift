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
													.cropImage,
													.captionBackgroundColor])
				case (.freeText, .background):
					MenuButtonStack(buttonsToShow: [.chooseImage,
													.cropImage,])
				case (.captionAbove, .caption):
					MenuButtonStack(buttonsToShow: [.font,
													.textSize,
													.textColor])
				case (.freeText, .caption):
					MenuButtonStack(buttonsToShow: [.addCaption,
													.font,
													.textSize,
													.textColor,
													.strokeColor])
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
