//
//  MenuButton.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/16/20.
//

import SwiftUI

struct MenuButton: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	var buttonType: EditStackSubMenuType
	
	var body: some View {
		Button {
			withAnimation {
				if buttonType == .chooseImage {
					viewRouter.currentSubMenu = .none
					viewRouter.showingImageSelector = true
				} else if buttonType == .addCaption {
					viewRouter.currentSubMenu = .none
					viewRouter.currentCaptionEditingIndex = meme.captions.count
				}
				else if viewRouter.currentSubMenu == buttonType {
					viewRouter.currentSubMenu = .none
				} else {
					viewRouter.currentSubMenu = buttonType
				}
			}
		} label: {
			Text(buttonType.rawValue)
		}
	}
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
		MenuButton(buttonType: .color)
			.environmentObject(ViewRouter())
    }
}
