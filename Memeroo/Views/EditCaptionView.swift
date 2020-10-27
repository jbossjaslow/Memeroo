//
//  EditCaptionView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/25/20.
//

import SwiftUI

struct EditCaptionView: View {
	@EnvironmentObject var meme: Meme
	
    var body: some View {
		VStack(spacing: 0) {
			Spacer()
			
			TextField(Constants.defaultCaptionText,
					  text: $meme.caption)
				.font(.system(size: 14))
				.foregroundColor(.black)
				.frame(height: 50)
				.padding(.horizontal, 10)
				.background(Color.white)
			
			if let memeImage = meme.image {
				Image(uiImage: memeImage)
					.resizable()
					.scaledToFit()
			}
			
			Spacer()
		}
		.modifier(SingleColorBackground(color: Color.myPink))
    }
}

struct EditCaptionView_Previews: PreviewProvider {
    static var previews: some View {
        EditCaptionView()
			.environmentObject(Meme().TestMeme())
    }
}
