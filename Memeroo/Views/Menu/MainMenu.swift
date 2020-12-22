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
	
    var body: some View {
//		NavigationView {
			VStack {
				Text("Memeroo")
				
				Spacer()
				
				Text("Select Meme Type")
				
				HStack {
					ForEach(values: MemeType.allCases) { memeType in
						Button {
							meme.setup(type: memeType)
							viewRouter.showingMemeEditor = true
						} label: {
							Text(memeType.rawValue)
						}
					}
				}
				
//				NavigationLink(destination: MemerooTabBar(),
//							   isActive: $viewRouter.showingMemeEditor) {
//					EmptyView()
//				}
				
				Spacer()
			}
//		}
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
			.environmentObject(ViewRouter())
			.environmentObject(Meme())
    }
}
