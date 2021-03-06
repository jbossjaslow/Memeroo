//
//  MemerooTabBar.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/27/20.
//

import SwiftUI

struct MemeEditorView: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	var body: some View {
		ZStack {
			VStack(spacing: 0) {
				MemerooNavBar()
				
				if meme.image != nil {
					Spacer()
				}
				
				CaptionAboveMemeView()
				
				Spacer()
				
				EditButtonStack()
				
				TabStack()
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
			} else if let index = viewRouter.currentCaptionEditingIndex {
				EditCaptionView(captionIndex: index)
					.zIndex(1) //necessary for animations on zstack
			}
		}
		.edgesIgnoringSafeArea(.bottom)
		.singleColorBackground(color: .myPink)
		.animation(.easeOut)
		.sheet(isPresented: $viewRouter.showingImageSelector) {
			SelectImageView()
		}
	}
}

struct MemerooTabBar_Previews: PreviewProvider {
	static var previews: some View {
		MemeEditorView()
			.environmentObject(ViewRouter())
			.environmentObject(Meme())
	}
}
