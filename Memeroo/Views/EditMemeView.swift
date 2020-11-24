//
//  EditMemeView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/23/20.
//

import SwiftUI

enum ActiveSheet: Identifiable {
	case picker, cropper
	
	var id: Int {
		hashValue
	}
}

struct EditMemeView: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@State fileprivate var activeSheet: ActiveSheet?
	
	var textColor: Color {
		switch viewRouter.currentView {
			case .background: return .gray
			case .caption: return .black
		}
	}
	
    var body: some View {
		VStack(spacing: 0) {
			Spacer()
			
			TextField(Constants.defaultCaptionText,
					  text: $meme.caption)
				.font(.system(size: 14))
				.foregroundColor(textColor)
				.frame(height: 50)
				.padding(.horizontal, 10)
				.background(Color.white)
				.disabled(viewRouter.currentView == .background)
			
			if let memeImage = meme.image {
				Image(uiImage: memeImage)
					.resizable()
					.scaledToFit()
					.onTapGesture {
						//if image is nil, don't bother showing focused image
						withAnimation {
							viewRouter.showingFocusedImage = meme.image != nil
						}
					}
			} else {
				Button {
					self.activeSheet = .picker
				} label: {
					ZStack {
						Rectangle()
							.fill(Color.clear)
						
						Text("Tap to select a picture")
							.foregroundColor(.white)
							.font(.headline)
					}
				}
			}
			
			Spacer()
		}
		.sheet(item: $activeSheet) { sheet in
			switch sheet {
				case .picker:
					ImagePicker(dismissFuncShouldShowCropper: dismiss(showCropperView:))
				case .cropper:
					ImageCropper(dismissFuncShouldShowCropper: dismiss(showCropperView:))
			}
		}
		//		.padding(.horizontal)
		.modifier(SingleColorBackground(color: Color.myPink))
    }
	
	private func dismiss(showCropperView: Bool) {
		activeSheet = showCropperView ? .cropper : nil
	}
}

struct EditMemeView_Previews: PreviewProvider {
    static var previews: some View {
        EditMemeView()
			.environmentObject(Meme().TestMeme())
			.environmentObject(ViewRouter())
    }
}
