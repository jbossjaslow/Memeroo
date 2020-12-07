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
	
	@State fileprivate var activeSheet: ActiveSheet?
	
	var body: some View {
		GeometryReader { geometry in
			ZStack {
				VStack(spacing: 0) {
					Spacer()
					
					EditMemeView() {
						//choose image chosen
						activeSheet = .picker
					}
					
					Spacer()
					
					EditButtonStack() {
						//choose image chosen
						activeSheet = .picker
					}
					
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
				} else if viewRouter.editingCaption {
					EditCaptionView()
						.zIndex(1) //necessary for animations on zstack
				}
			}
			.edgesIgnoringSafeArea(.bottom)
			.singleColorBackground(color: .myPink)
			.animation(.easeOut)
			.sheet(item: $activeSheet) { sheet in
				switch sheet {
					case .picker:
						ImagePicker(dismissFuncShouldShowCropper: dismiss(showCropperView:))
					case .cropper:
						ImageCropper(dismissFuncShouldShowCropper: dismiss(showCropperView:))
				}
			}
		}
	}
	
	private func dismiss(showCropperView: Bool) {
		activeSheet = showCropperView ? .cropper : nil
	}
}

struct MemerooTabBar_Previews: PreviewProvider {
	static var previews: some View {
		MemerooTabBar()
			.environmentObject(ViewRouter())
			.environmentObject(Meme())
	}
}
