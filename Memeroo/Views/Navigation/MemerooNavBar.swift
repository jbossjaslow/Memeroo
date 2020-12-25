//
//  MemerooNavBar.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/20/20.
//

import SwiftUI

struct MemerooNavBar: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
    var body: some View {
		HStack {
			//Leading views
			Button {
				//prompt in case of accident
				if true {
					meme.resetToDefault()
					viewRouter.resetToDefault()
					viewRouter.showingMemeEditor = false
				}
			} label: {
				Image(systemName: "arrowshape.turn.up.left.fill")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.accentColor(.black)
					.frame(height: 15)
			}
			
			Spacer()
			
			//Center Views
			
			Spacer()
			
			//Trailing Views
			ShareButton()
		}
		.frame(height: 50)
		.padding(.horizontal, 10)
		.background(Color.offWhite)
    }
}

struct MemerooNavBar_Previews: PreviewProvider {
    static var previews: some View {
        MemerooNavBar()
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeCaptionAbove())
    }
}
