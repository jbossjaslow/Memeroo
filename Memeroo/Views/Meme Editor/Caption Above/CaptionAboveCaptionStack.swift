//
//  CaptionAboveCaptionStack.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/30/20.
//

import SwiftUI

struct CaptionAboveCaptionStack: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
    var body: some View {
		HStack {
			if meme.alignment != .leading {
				Spacer()
			}
			
			Text(meme.captions.first?.text ?? Constants.Text.defaultCaptionText)
				.font(.custom(meme.fontFamily,
							  size: meme.fontSize))
				.foregroundColor(meme.fontColor)
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
		.background(meme.captionBackgroundColor)
    }
}

struct TestCaptionAboveCaptionAsImage: View {
	@State var image: UIImage?
	
	var body: some View {
		Image(uiImage: image ?? UIImage())
			.onAppear {
				image = CaptionAboveCaptionStack()
					.environmentObject(Meme().TestMemeCaptionAbove()).asImage()
			}
	}
}

struct CaptionAboveCaptionStack_Previews: PreviewProvider {
	static var image: UIImage? = nil
	
    static var previews: some View {
//        CaptionAboveCaptionStack()
//			.environmentObject(Meme().TestMemeCaptionAbove())
//			.environmentObject(ViewRouter())
		
		TestCaptionAboveCaptionAsImage()
	}
}
