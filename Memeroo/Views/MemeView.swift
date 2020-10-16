//
//  MemeView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/15/20.
//

import SwiftUI

fileprivate enum ActiveSheet: Identifiable {
	case picker, cropper
	
	var id: Int {
		hashValue
	}
}

struct MemeView: View {
	@EnvironmentObject var meme: Meme
	
	@State fileprivate var activeSheet: ActiveSheet?
	
	var body: some View {
		VStack {
			TextField("Type caption here",
					  text: $meme.caption)
				.font(.system(size: 14))
				.frame(minHeight: 30)
				.padding(.horizontal,
						 10)
				.border(Color.black,
						width: 2)
			
			ZStack {
				if let memeImage = meme.image {
					Image(uiImage: memeImage)
						.resizable()
						.scaledToFit()
				} else {
					Rectangle()
						.fill(Color.secondary)
					
					Text("Tap to select a picture")
						.foregroundColor(.white)
						.font(.headline)
				}
			}
			.onTapGesture {
				self.activeSheet = .picker
			}
		}
		.sheet(item: $activeSheet) { sheet in
			switch sheet {
				case .picker:
					ImagePicker(dismissFuncShouldShowCropper: dismiss(showCropperView:))
				case .cropper:
					ImageCropper(dismissFuncShouldShowCropper: dismiss(showCropperView:))
			}
		}
	}
	
	private func dismiss(showCropperView: Bool) {
		activeSheet = showCropperView ? .cropper : nil
	}
	
	static func renderMemeView(caption: String,
							   image: UIImage) -> UIImage {
		let stack = VStack {
			HStack {
				Text(caption)
					.font(.system(size: 14))
					.frame(minHeight: 30)
					.padding(.horizontal,
							 10)
				
				Spacer()
			}
			.border(Color.black,
					width: 2)
			
			Image(uiImage: image)
				.resizable()
				.scaledToFit()
		}
		
		return stack.asImage()
	}
}

struct MemeView_Previews: PreviewProvider {
	
    static var previews: some View {
		MemeView()
			.environmentObject(Meme())
    }
}
