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
	
	var textColor: Color {
		switch viewRouter.currentTab {
			case .background:
				if let caption = meme.captions.first,
				   caption != Constants.Text.defaultCaptionText {
					return meme.fontColor
				}
				return .gray
			case .caption: return meme.fontColor
		}
	}
	
    var body: some View {
		VStack(spacing: 0) {
			//Caption
			HStack {
				if meme.alignment != .leading {
					Spacer()
				}
				
				Text(meme.captions.first ?? Constants.Text.defaultCaptionText)
					.font(.custom(meme.fontFamily,
								  size: meme.fontSize))
					.foregroundColor(textColor)
					.padding(.horizontal, 10)
					.padding(.vertical, 15)
					.multilineTextAlignment(meme.alignment)
				
				if meme.alignment != .trailing {
					Spacer()
				}
			}
			.contentShape(Rectangle())
			.animation(.easeInOut)
			.onTapGesture {
				withAnimation {
					if viewRouter.currentTab == .caption,
					   meme.captions.count == 1 {
						viewRouter.currentCaptionEditingIndex = 0
					}
				}
			}
			.background(meme.captionColor)
			
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
		.onAppear {
			meme.currentMemeView = AnyView(
				self
					.environmentObject(meme)
					.environmentObject(viewRouter)
			)
		}
    }
}

struct EditMemeView_Previews: PreviewProvider {
    static var previews: some View {
        CaptionAboveMemeView()
			.environmentObject(Meme().TestMemeCaptionAbove())
			.environmentObject(ViewRouter())
    }
}
