//
//  ImageSelectionView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/9/20.
//

import SwiftUI

struct ImageSelectionView: View {
	@EnvironmentObject var meme: Meme
	
    var body: some View {
		VStack {
			MemeView()
			
			Button(action: showShareSheet) {
				Text("Share meme")
			}
		}
		.padding(.horizontal)
	}
	
	func showShareSheet() {
		guard let image = meme.image else { return }
		let imageToSend = MemeView.renderMemeView(caption: meme.caption,
												  image: image)
		let av = UIActivityViewController(activityItems: [imageToSend],
										  applicationActivities: nil)
		let root = UIApplication.shared.windows.first?.rootViewController
		root?.present(av,
					  animated: true)
	}
}

struct ActionsPageView: View {
	var body: some View {
//		TabView {
//
//		}
		Text("Hello World")
	}
}

struct ImageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSelectionView()
    }
}
