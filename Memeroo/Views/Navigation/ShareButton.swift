//
//  ShareButton.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/27/20.
//

import SwiftUI

struct ShareButton: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@State private var buttonSize: CGFloat = 20
	
	var body: some View {
		Button(action: showShareSheet) {
			Image(systemName: "square.and.arrow.up")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.foregroundColor(.myPink)
				.frame(width: buttonSize, height: buttonSize)
				.font(.system(size: 16, weight: .bold))
		}
	}
	
	func showShareSheet() {
		guard let imageToSend = meme.render() else { return }
		ViewRouter.performSimpleHaptics_ChoseSelection()
		let av = UIActivityViewController(activityItems: [imageToSend],
										  applicationActivities: nil)
		av.completionWithItemsHandler = { (activity, success, items, error) in
			if let error = error {
				print("Error: \(error)")
			}
			else if success {
				viewRouter.popSuccess()
			} else {
				print("Failed for some other reason")
			}
		}
		let root = UIApplication.shared.windows.first?.rootViewController
		root?.present(av, animated: true)
	}
}

struct ShareButton_Previews: PreviewProvider {
	static var previews: some View {
		ShareButton()
			.environmentObject(Meme().TestMemeCaptionAbove())
	}
}
