//
//  MainView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/16/20.
//

import SwiftUI

struct MainView: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
    var body: some View {
//		VStack {
//			if viewRouter.showingMainMenu {
//				MainMenu()
//			} else {
//				MemerooTabBar()
//					.animation(.easeInOut)
//					.transition(.move(edge: .trailing))
//			}
//		}
		MainMenu()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
			.environmentObject(ViewRouter())
			.environmentObject(Meme())
    }
}
