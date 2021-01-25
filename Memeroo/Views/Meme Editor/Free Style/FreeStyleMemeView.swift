//
//  FreeStyleMemeEditorView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/21/20.
//

import SwiftUI

struct FreeStyleMemeView: View {
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
					FreeStyleCaption(caption: caption,
									offset: caption.offset)
						.zIndex(1)
				}
			} else {
				Spacer()
			}
		}
    }
}

struct FreeStyleMemeEditorView_Previews: PreviewProvider {
    static var previews: some View {
        FreeStyleMemeView()
			.environmentObject(Meme().TestMemeFreeStyle())
			.environmentObject(ViewRouter())
    }
}
