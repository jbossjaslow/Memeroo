//
//  ShareSheetView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/23/20.
//

import SwiftUI

struct ShareSheetView: View {
	@EnvironmentObject var meme: Meme
	
	@State private var memeToRender: UIImage = UIImage()
	@State private var togge: Bool = false
	
    var body: some View {
		VStack {
			Spacer()
			
			Image(uiImage: meme.renderedImage)
				.resizable()
				.aspectRatio(contentMode: .fit)
			
			Spacer()
			
			Button(action: showShareSheet) {
				Text("Share Meme")
					.foregroundColor(.black)
					.frame(width: 100, height: 50)
			}
			.buttonStyle(ColorfulShareSheetStyle(shape: RoundedRectangle(cornerRadius: 25),
												 colorTheme: .myPink))
			
//			Toggle("Hello", isOn: $togge)
//				.toggleStyle(ColorfulToggleStyle(colorTheme: .myPink,
//												 shape: RoundedRectangle(cornerRadius: 25)))
			
			Spacer()
		}
		.modifier(SingleColorBackground(color: Color.myPink))
    }
	
	func showShareSheet() {
		guard meme.image != nil else { return }
		let imageToSend = meme.renderedImage
		let av = UIActivityViewController(activityItems: [imageToSend],
										  applicationActivities: nil)
		let root = UIApplication.shared.windows.first?.rootViewController
		root?.present(av,
					  animated: true)
	}
}

struct ShareSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ShareSheetView()
			.environmentObject(Meme().TestMeme())
    }
}
