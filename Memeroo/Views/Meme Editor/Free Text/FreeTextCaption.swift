//
//  FreeTextCaption.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/21/20.
//

import SwiftUI

struct FreeTextCaption: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@State var caption: String
//	@State var index: Int
	@State private var currentOffset: CGSize = .zero
	@State private var finalOffset: CGSize = .zero
	private var offset: CGSize {
		return currentOffset + finalOffset
	}
	
    var body: some View {
		Text(caption)
			.font(.custom(meme.fontFamily,
						  size: meme.fontSize))
			.foregroundColor(meme.fontColor)
			.offset(offset)
			.animation(nil)
			.onTapGesture {
//				viewRouter.currentCaptionEditingIndex = index
				viewRouter.currentCaptionEditingIndex = meme.captions.firstIndex(of: caption)
			}
			.gesture(
				DragGesture()
					.onChanged { gesture in
						self.currentOffset = gesture.translation
					}
					.onEnded { gesture in
						self.finalOffset += self.currentOffset
						self.currentOffset = .zero
					}
			)
    }
}

struct FreeTextCaption_Previews: PreviewProvider {
	@State static var caption: String = Constants.Text.defaultCaptionText
	
    static var previews: some View {
		FreeTextCaption(caption: caption)
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeFreeText())
    }
}
