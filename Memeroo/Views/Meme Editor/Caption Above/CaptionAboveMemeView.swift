//
//  EditMemeView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/23/20.
//

import SwiftUI

struct CaptionAboveMemeView: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
    var body: some View {
		VStack(spacing: 0) {
			//Caption
			CaptionAboveCaptionStack()
			
			//Image
			if let memeImage = meme.image {
				Image(uiImage: memeImage)
					.resizable()
					.scaledToFit()
					.onTapGesture {
						//if image is nil, don't bother showing focused image
						viewRouter.showingFocusedImage = meme.image != nil
					}
			}
			else {
				Spacer()
			}
		}
    }
}

struct TestCaptionAboveAsImage: View {
	@EnvironmentObject var meme: Meme
	
	@State var image: UIImage?
	
	var body: some View {
		Image(uiImage: image ?? UIImage())
			.onAppear {
//				image = CaptionAboveMemeView()
//					.environmentObject(meme).asImage()
				image = meme.render()
			}
	}
}

struct EditMemeView_Previews: PreviewProvider {
    static var previews: some View {
        CaptionAboveMemeView()
			.environmentObject(Meme().TestMemeCaptionAbove())
			.environmentObject(ViewRouter())
		
//		TestCaptionAboveAsImage()
//			.environmentObject(Meme().TestMemeCaptionAbove())
    }
}
