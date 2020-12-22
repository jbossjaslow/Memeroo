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
		VStack {
			if viewRouter.showingMemeEditor {
				MemeEditorView()
					.transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.25)))
			} else {
				MainMenu()
					.transition(AnyTransition.scale.animation(.easeInOut(duration: 0.5)))
			}
		}
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
			.environmentObject(ViewRouter())
			.environmentObject(Meme())
    }
}
