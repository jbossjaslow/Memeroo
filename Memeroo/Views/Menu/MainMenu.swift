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
		NavigationView {
			VStack {
				Text("Memeroo")
				
				Spacer()
				
				Text("Select Meme Type")
				
				HStack {
//					Button {
//						meme.memeType = .captionAbove
//						viewRouter.showingMainMenu = false
//					} label: {
//						Text("Caption Above")
//					}
					
					NavigationLink(destination: Text("Destination"),
								   isActive: $meme.memeType != nil,
								   label: {
									Text("Navigate")
								   })
					
//					Button {
//						meme.memeType = .freeText
//						viewRouter.showingMainMenu = false
//					} label: {
//						Text("Free Text")
//					}
				}
				
				Spacer()
			}
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
