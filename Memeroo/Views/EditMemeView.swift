//
//  EditMemeView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/23/20.
//

import SwiftUI

struct EditMemeView: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	var chooseImage: (() -> Void)? = nil
	
	var textColor: Color {
		switch viewRouter.currentView {
			case .background: return .gray
			case .caption: return meme.fontColor
		}
	}
	
    var body: some View {
		VStack(spacing: 0) {
			HStack {
				if meme.alignment != .leading {
					Spacer()
				}
				
				Text(meme.caption)
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
			.onTapGesture {
				withAnimation {
					if viewRouter.currentView == .caption {
						viewRouter.editingCaption = true
					}
				}
			}
			.background(meme.captionColor)
			
			if let memeImage = meme.image {
				Image(uiImage: memeImage)
					.resizable()
					.scaledToFit()
					.onTapGesture {
						//if image is nil, don't bother showing focused image
						withAnimation {
							viewRouter.showingFocusedImage = meme.image != nil
						}
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
        EditMemeView()
			.environmentObject(Meme().TestMeme())
			.environmentObject(ViewRouter())
    }
}
