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
				
				switch meme.memeType {
					case .captionAbove:
						CaptionAboveMemeView()
					case .freeText:
						FreeTextMemeView()
					default:
						Text("There is an error, please reload")
				}
				
				Spacer()
				
				EditButtonStack()
				
				TabStack()
			}
			.disabled(viewRouter.showingFocusedImage)
			.zIndex(0) //necessary for animations on zstack
			
			PopupView()
		}
		.edgesIgnoringSafeArea(.bottom)
		.singleColorBackground(color: .myPink)
		.animation(.easeOut)
		.sheet(isPresented: $viewRouter.showingImageSelector) {
			SelectImageView(selectionMode: viewRouter.imageSelectionMode)
		}
		.onAppear {
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
				viewRouter.showingImageSelector = true
				viewRouter.imageSelectionMode = .imageSelectionAndCropping
			}
		}
	}
}

struct MemerooTabBar_Previews: PreviewProvider {
	static var previews: some View {
		MemeEditorView()
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeCaptionAbove())
	}
}
