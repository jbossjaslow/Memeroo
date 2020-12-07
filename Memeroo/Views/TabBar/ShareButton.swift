//
//  ShareButton.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/27/20.
//

import SwiftUI

struct ShareButton: View {
	@EnvironmentObject var meme: Meme
	
	@State private var circleSize: CGFloat = 50
	@State private var buttonSize: CGFloat = 25
	
	var body: some View {
		ZStack {
			Circle()
				.frame(width: circleSize, height: circleSize)
				.foregroundColor(.offWhite)
			
			Button(action: showShareSheet) {
				Image(systemName: "square.and.arrow.up")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.foregroundColor(.myPink)
					.frame(width: buttonSize, height: buttonSize)
			}
//			.buttonStyle(ColorfulShareSheetStyle(shape: Circle(),
//												 colorTheme: .offWhite))
		}
		.shadow(color: Color.black.opacity(0.5), radius: 5)
	}
	
	func showShareSheet() {
		let imageToSend = meme.render()
		guard imageToSend != UIImage() else { return }
		let av = UIActivityViewController(activityItems: [imageToSend],
										  applicationActivities: nil)
		let root = UIApplication.shared.windows.first?.rootViewController
		root?.present(av, animated: true)
	}
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton()
			.environmentObject(Meme().TestMeme())
    }
}
