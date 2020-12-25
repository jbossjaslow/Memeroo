//
//  MainMenu.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/16/20.
//

import SwiftUI

struct MainMenu: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@State private var selection: Int = 0
	
	var body: some View {
		VStack {
			Text("Memeroo")
			
			Spacer()
			
			Text("Select Meme Type")
			
			TabView(selection: $selection) {
				ForEachWithIndex(MemeType.allCases) { index, memeType in
					MemeTypePreview(type: memeType)
						.tag(index)
				}
			}
			.tabViewStyle(PageTabViewStyle())
			.indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
			.frame(height: 200)
			.onChange(of: selection) { _ in
				ViewRouter.performSimpleHaptics_SelectionChanged()
			}
			
			Spacer()
		}
	}
}

struct MainMenu_Previews: PreviewProvider {
	static var previews: some View {
		MainMenu()
			.environmentObject(ViewRouter())
			.environmentObject(Meme())
	}
}
