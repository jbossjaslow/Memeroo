//
//  MemerooTabBar.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/27/20.
//

import SwiftUI

struct MemerooTabBar: View {
	
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	var body: some View {
		GeometryReader { geometry in
			VStack {
				switch viewRouter.currentView {
					case .background: ImageSelectionView()
					case .caption: EditCaptionView()
				}
				
				HStack {
					TabIcon(tabType: .background,
							geometry: geometry)
					
					ShareButton()
						.offset(y: (-geometry.size.height / 10) / 2)
					
					TabIcon(tabType: .caption,
							geometry: geometry)
				}
				.padding(.bottom, 5)
				.frame(width: geometry.size.width, height: geometry.size.height/10)
				.background(Color.offWhite.shadow(radius: 2))
			}
			.edgesIgnoringSafeArea(.bottom)
		}
	}
}

struct MemerooTabBar_Previews: PreviewProvider {
	static var previews: some View {
		MemerooTabBar()
			.environmentObject(ViewRouter())
			.environmentObject(Meme())
	}
}
