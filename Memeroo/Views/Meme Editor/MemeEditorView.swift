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
	
	private var captionEditingMode: CaptionEditingMode {
		switch meme.memeType {
			case .captionAbove:
				return .editingExisting
			case .freeText:
				if let index = viewRouter.currentCaptionEditingIndex,
				   meme.captions.indices.contains(index) {
					return .editingExisting
				} else {
					return .addingNew
				}
			default:
				return .editingExisting
		}
	}
	
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
			
			if viewRouter.showingFocusedImage,
			   let memeImage = meme.image {
				FocusedImageViewer(image: Image(uiImage: memeImage)) {
					//removal
					viewRouter.showingFocusedImage = false
				}
				.zIndex(1) //necessary for animations on zstack
			} else if let index = viewRouter.currentCaptionEditingIndex {
				EditCaptionView(captionIndex: index,
								editingMode: captionEditingMode)
					.zIndex(1) //necessary for animations on zstack
			}
		}
		.edgesIgnoringSafeArea(.bottom)
		.singleColorBackground(color: .myPink)
		.animation(.easeOut)
		.sheet(isPresented: $viewRouter.showingImageSelector) {
			SelectImageView()
		}
		.onAppear {
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
				viewRouter.showingImageSelector = true
			}
		}
	}
}

struct MemerooTabBar_Previews: PreviewProvider {
	static var previews: some View {
		MemeEditorView()
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeFreeText())
	}
}
