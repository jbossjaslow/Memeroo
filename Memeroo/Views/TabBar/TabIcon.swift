//
//  TabIcon.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/27/20.
//

import SwiftUI

struct TabIcon: View {
	@EnvironmentObject var viewRouter: ViewRouter
	
	@State var tabType: TabType
	@State private var togge: Bool = false
	
	private var imageName: String {
		switch tabType {
			case .background: return "photo"
			case .caption: return "captions.bubble"
		}
	}
	
	private var labelName: String {
		switch tabType {
			case .background: return "Image"
			case .caption: return "Caption"
		}
	}
	
	var body: some View {
		Toggle(isOn: $togge) {
			toggleBody
		}
		.animation(.easeOut)
		.toggleStyle(NormalToggleStyle(colorTheme: .offWhite,
									   shape: RoundedRectangle(cornerRadius: 10),
									   tabType: tabType))
	}
	
	private var toggleBody: some View {
		VStack(alignment: .center, spacing: 0) {
			Image(systemName: imageName)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.foregroundColor(viewRouter.currentTab == tabType ? .myPink : .gray)
				.font(.system(size: 16, weight: viewRouter.currentTab == tabType ? .bold : .regular))
			
			Text(labelName)
				.font(.system(size: 12, weight: viewRouter.currentTab == tabType ? .bold : .regular))
				.foregroundColor(viewRouter.currentTab == tabType ? .myPink : .gray)
		}
		.frame(width: 80, height: 40)
		.animation(nil)
	}
}

struct TabIcon_Previews: PreviewProvider {
	static var previews: some View {
		TabIcon(tabType: .background)
			.environmentObject(Meme().TestMemeCaptionAbove())
			.environmentObject(ViewRouter())
	}
}
