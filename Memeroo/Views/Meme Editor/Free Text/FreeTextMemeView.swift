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
					.zIndex(0)
				
				ForEach(meme.multiCaptions, id: \.self) { caption in
					FreeTextCaption(caption: caption,
									offset: caption.offset)
						.zIndex(1)
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
