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
			ZStack {
				VStack(spacing: 0) {
					EditMemeView()
					
					EditButtonStack()
					
					TabStack(geometry: geometry)
				}
				.disabled(viewRouter.showingFocusedImage)
				.zIndex(0) //necessary for animations on zstack
				
				if viewRouter.showingFocusedImage,
				   let memeImage = meme.image {
					FocusedImageViewer(image: Image(uiImage: memeImage)) {
						//removal
						viewRouter.showingFocusedImage = false
					}
					.zIndex(1) //necessary for animations on zstack
				}
			}
			.edgesIgnoringSafeArea(.bottom)
			.singleColorBackground(color: .myPink)
			.animation(.easeOut)
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
