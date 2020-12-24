//
//  MenuButtonStack.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/22/20.
//

import SwiftUI

struct MenuButtonStack: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@State var buttonsToShow: [EditStackSubMenuType]
	
    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(spacing: 30) {
				ForEach(buttonsToShow, id: \.rawValue) { button in
					MenuButton(buttonType: button)
				}
			}
		}
		.padding(.horizontal, 10)
		.animation(.easeOut)
		//			.shadow(radius: currentSubMenu == .none ? 0 : 1, y: currentSubMenu == .none ? 0 : -1)
		.frame(height: Constants.EditButtons.menuHeight)
		.frame(maxWidth: .infinity)
		.background(Color.ViewColors.editButtonBackground)
    }
}

struct MenuButtonStack_Previews: PreviewProvider {
    static var previews: some View {
		MenuButtonStack(buttonsToShow: [.chooseImage, .addCaption])
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeCaptionAbove())
    }
}
