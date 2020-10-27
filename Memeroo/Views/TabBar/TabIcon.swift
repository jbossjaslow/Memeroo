//
//  TabIcon.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/27/20.
//

import SwiftUI

enum TabType {
	case background
	case caption
}

struct TabIcon: View {
	@EnvironmentObject var viewRouter: ViewRouter
	
	@State var tabType: TabType
	var geometry: GeometryProxy
	
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
	@State private var togge: Bool = false
	var body: some View {
		Toggle(isOn: $togge) {
			VStack(spacing: 5) {
				Image(systemName: imageName)
					.resizable()
					.aspectRatio(contentMode: .fit)
					.foregroundColor(viewRouter.currentView == tabType ? .myPink : .gray)
				
				Text(labelName)
					.font(.system(size: 12))
					.bold()
					.foregroundColor(viewRouter.currentView == tabType ? .myPink : .gray)
			}
			.frame(width: geometry.size.width/5, height: 40)
		}
		.animation(.easeOut)
		.toggleStyle(MemerooToggleStyle(colorTheme: .offWhite,
										shape: RoundedRectangle(cornerRadius: 10),
										tabType: tabType))
	}
}

struct TabIcon_Previews: PreviewProvider {
    static var previews: some View {
		GeometryReader { geometry in
			TabIcon(tabType: .background,
					geometry: geometry)
				.environmentObject(Meme().TestMeme())
				.environmentObject(ViewRouter())
		}
    }
}
