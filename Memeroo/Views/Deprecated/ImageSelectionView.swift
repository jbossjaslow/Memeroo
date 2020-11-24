//
//  ImageSelectionView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/9/20.
//

import SwiftUI

//enum ActiveSheet: Identifiable {
//	case picker, cropper
//	
//	var id: Int {
//		hashValue
//	}
//}

struct ImageSelectionView: View {
	@EnvironmentObject var meme: Meme
	
	@State fileprivate var activeSheet: ActiveSheet?
	
	var body: some View {
		VStack(spacing: 0) {
			Spacer()
			
			TextField(Constants.defaultCaptionText,
					  text: $meme.caption)
				.font(.system(size: 14))
				.foregroundColor(.gray)
				.frame(height: 50)
				.padding(.horizontal, 10)
				.background(Color.white)
				.disabled(true)
			
			if let memeImage = meme.image {
				Image(uiImage: memeImage)
					.resizable()
					.scaledToFit()
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

struct ImageSelectionView_Previews: PreviewProvider {
	static var previews: some View {
		ImageSelectionView()
			.environmentObject(Meme().TestMeme())
	}
}
