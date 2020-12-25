//
//  PopupView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/24/20.
//

import SwiftUI

struct PopupView: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	private var captionEditingMode: CaptionEditingMode {
		switch meme.memeType {
			case .captionAbove:
				return .editingExisting
			case .freeText:
				if let index = viewRouter.currentCaptionEditingIndex,
				   meme.captions.indices.contains(index) {
					return .editingExisting
				} else {
					return .addingNew
				}
			default:
				return .editingExisting
		}
	}
	
	@ViewBuilder
    var body: some View {
		if viewRouter.showingFocusedImage,
		   let memeImage = meme.image {
			FocusedImageViewer(image: Image(uiImage: memeImage)) {
				//removal
				viewRouter.showingFocusedImage = false
			}
			.zIndex(1) //necessary for animations on zstack
		} else if let index = viewRouter.currentCaptionEditingIndex {
			EditCaptionView(captionIndex: index,
							editingMode: captionEditingMode)
				.zIndex(1) //necessary for animations on zstack
		}
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView()
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeFreeText())
    }
}
