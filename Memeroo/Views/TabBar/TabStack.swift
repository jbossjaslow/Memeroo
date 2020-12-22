//
//  TabStack.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/23/20.
//

import SwiftUI

struct TabStack: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	var body: some View {
		HStack() {
			Spacer()
			
			TabIcon(tabType: .background)
			
			Spacer()
			
			TabIcon(tabType: .caption)
			
			Spacer()
		}
		.padding(.bottom, 20)
		.frame(height: 70)
		.background(Color.offWhite.shadow(radius: 2))
		.onChange(of: viewRouter.currentTab) { tab in
			if tab == .caption {
				switch meme.memeType {
					case .captionAbove:
						if meme.captions.first == Constants.Text.defaultCaptionText {
							viewRouter.currentCaptionEditingIndex = 0
						}
					default:
						if meme.captions.isEmpty {
							viewRouter.currentCaptionEditingIndex = 0
						}
				}
			}
		}
	}
}

struct TabStack_Previews: PreviewProvider {
	static var previews: some View {
		TabStack()
			.environmentObject(ViewRouter())
			.environmentObject(Meme())
	}
}
