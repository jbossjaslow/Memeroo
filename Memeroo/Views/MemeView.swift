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
	@State private var image: Image? = nil
	
	@State fileprivate var activeSheet: ActiveSheet?
	
	@Binding var inputImage: UIImage?
	@Binding var captionText: String
	
	var body: some View {
		VStack {
			TextField("Type caption here",
					  text: $captionText)
				.font(.system(size: 14))
				.frame(minHeight: 30)
				.padding(.horizontal,
						 10)
				.border(Color.black,
						width: 2)
			
			ZStack {
				if image != nil {
					image?
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
				print("Tapped")
//				self.showingImagePicker = true
				self.activeSheet = .picker
			}
		}
		.sheet(item: $activeSheet) { sheet in
			switch sheet {
				case .picker:
					ImagePicker(dismissFuncShouldShowCropper: dismiss(showCropperView:),
								image: $inputImage)
				case .cropper:
					ImageCropper(dismissFuncShouldShowCropper: dismiss(showCropperView:),
								 image: $inputImage)
			}
		}
	}
	
	private func dismiss(showCropperView: Bool) {
		guard inputImage != nil else {
			activeSheet = nil
			return
		}
		if showCropperView {
			activeSheet = .cropper
		} else {
			activeSheet = nil
			loadImage()
		}
	}
	
	private func loadImage() {
		guard let inputImage = inputImage else { return }
		image = Image(uiImage: inputImage)
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
	@State static var inputImage: UIImage?
	@State static var captionText: String = "Caption"
	
    static var previews: some View {
		MemeView(inputImage: $inputImage,
				 captionText: $captionText)
    }
}
