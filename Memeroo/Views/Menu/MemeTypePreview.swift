//
//  MemeTypePreview.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/25/20.
//

import SwiftUI

struct MemeTypePreview: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@State var type: MemeType
	@State private var previewMeme = Meme().TestMemeFreeText().setPreviewTestMemeCaptions()
	
	@State private var scaleAmount: CGFloat = 0.75
	@State private var cornerRadius: CGFloat = 25
	
	var body: some View {
		VStack(spacing: 0) {
			
//			switch type {
//				case .captionAbove:
//					ZStack(alignment: .top) {
//						Image("TestImage")
//							.resizable()
//							.aspectRatio(contentMode: .fit)
//						
//						HStack {
//							Text(meme.captions.first?.text ?? Constants.Text.defaultCaptionText)
//								.font(.custom(meme.fontFamily,
//											  size: meme.fontSizes.first ?? 14))
//								.foregroundColor(meme.fontColor)
//								.padding(.horizontal, 10)
//								.padding(.vertical, 15)
//								.multilineTextAlignment(meme.alignment)
//							
//							Spacer()
//						}
//						.background(meme.captionBackgroundColor)
//					}
//					.padding()
//				case .freeText:
//					ZStack() {
//						Image("TestImage")
//							.resizable()
//							.aspectRatio(contentMode: .fit)
//						
//						FreeTextCaption(caption: Caption("Top Text"),
//										offset: .init(width: 0,
//													  height: -90))
//							.environmentObject(previewMeme)
//						
//						FreeTextCaption(caption: Caption("Bottom Text"),
//										offset: .init(width: 0,
//													  height: 90))
//							.environmentObject(previewMeme)
//					}
//					.padding()
//			}
			
//			Spacer()
			
			Text(type.rawValue)
				.font(.system(size: 20, weight: .bold))
				.padding(.bottom, 10)
				.foregroundColor(.white)
		}
		.background(
			RoundedRectangle(cornerRadius: cornerRadius)
				.fill(Color.gray)
		)
		.padding()
//		.frame(height: 300)
//		.scaleEffect(CGSize(width: scaleAmount, height: scaleAmount))
		.contentShape(RoundedRectangle(cornerRadius: cornerRadius))
		.onTapGesture {
			ViewRouter.performSimpleHaptics_ChoseSelection()
			meme.setup(type: type)
			viewRouter.showingMemeEditor = true
		}
	}
}

struct MemeTypePreview_Previews: PreviewProvider {
	static var previews: some View {
		MemeTypePreview(type: .freeText)
			.environmentObject(ViewRouter())
			.environmentObject(Meme())
	}
}
