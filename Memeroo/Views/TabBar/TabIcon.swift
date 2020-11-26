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
	var geometry: GeometryProxy
	
	@State private var normalToggleStyle = true
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
		if normalToggleStyle {
			Toggle(isOn: $togge) {
				toggleBody
			}
			.animation(.easeOut)
			.toggleStyle(NormalToggleStyle(colorTheme: .offWhite,
										   shape: RoundedRectangle(cornerRadius: 10),
										   tabType: tabType))
		} else {
			Toggle(isOn: $togge) {
				toggleBody
			}
			.animation(.easeOut)
			.toggleStyle(MemerooToggleStyle(colorTheme: .offWhite,
											shape: RoundedRectangle(cornerRadius: 10),
											tabType: tabType))
		}
	}
	
	private var toggleBody: some View {
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
