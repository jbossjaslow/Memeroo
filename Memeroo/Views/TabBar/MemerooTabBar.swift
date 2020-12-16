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
					Spacer()
					
					EditMemeView() {
						//choose image chosen
						viewRouter.showingPicker = true
					}
					.onAppear {
						DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
							viewRouter.showingPicker = true
						}
					}
					
					Spacer()
					
					EditButtonStack() {
						//choose image chosen
						viewRouter.showingPicker = true
					}
					
					TabStack(geometry: geometry)
						.onChange(of: viewRouter.currentView) { view in
							if view == .caption && meme.caption == Constants.defaultCaptionText {
								viewRouter.editingCaption = true
							}
						}
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
				} else if viewRouter.editingCaption {
					EditCaptionView()
						.zIndex(1) //necessary for animations on zstack
				}
			}
			.edgesIgnoringSafeArea(.bottom)
			.singleColorBackground(color: .myPink)
			.animation(.easeOut)
			.sheet(isPresented: $viewRouter.showingPicker) {
				SelectImageView()
			}
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
