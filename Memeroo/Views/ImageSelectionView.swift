//
//  ImageSelectionView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/9/20.
//

import SwiftUI

struct ImageSelectionView: View {
	
	@State private var inputImage: UIImage?
	@State private var captionText: String = ""
	
    var body: some View {
		VStack {
			MemeView(inputImage: $inputImage,
					 captionText: $captionText)
			
			Button(action: showShareSheet) {
				Text("Share meme")
			}
		}
		.padding(.horizontal)
	}
	
	func showShareSheet() {
		guard let image = inputImage else { return }
		let imageToSend = MemeView.renderMemeView(caption: captionText,
												  image: image)
		let av = UIActivityViewController(activityItems: [imageToSend],
										  applicationActivities: nil)
		let root = UIApplication.shared.windows.first?.rootViewController
		root?.present(av,
					  animated: true,
					  completion: nil)
	}
}

struct ImageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSelectionView()
    }
}
