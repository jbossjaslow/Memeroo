//
//  FreeTextMemeEditorView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/21/20.
//

import SwiftUI

struct FreeTextMemeView: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	var textColor: Color {
		switch viewRouter.currentTab {
			case .background:
				if let caption = meme.captions.first?.text,
				   caption != Constants.Text.defaultCaptionText {
					return meme.fontColor
				}
				return .gray
			case .caption: return meme.fontColor
		}
	}
	
    var body: some View {
		ZStack {
			if let memeImage = meme.image {
				Image(uiImage: memeImage)
					.resizable()
					.scaledToFit()
					.onTapGesture {
						//if image is nil, don't bother showing focused image
						viewRouter.showingFocusedImage = meme.image != nil
					}
				
				ForEach(meme.captions, id: \.self) { caption in
					FreeTextCaption(caption: caption,
									offset: caption.offset)
				}
			} else {
				Spacer()
			}
		}
    }
}

struct FreeTextMemeEditorView_Previews: PreviewProvider {
    static var previews: some View {
        FreeTextMemeView()
			.environmentObject(Meme().TestMemeFreeText())
			.environmentObject(ViewRouter())
    }
}
