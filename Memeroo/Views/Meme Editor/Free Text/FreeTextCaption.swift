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
	
	@State var caption: Caption
	@State private var currentOffset: CGSize = .zero
	@State var offset: CGSize
	
	@State private var currIndex: Int = 0
	
    var body: some View {
		Text(caption.text)
			.font(.custom(meme.fontFamily,
						  size: meme.fontSize))
			.foregroundColor(meme.fontColor)
			.addTextStroke(text: caption.text)
			.animation(nil)
			.offset(offset + currentOffset)
			.onAppear {
				currIndex = meme.captions.firstIndex(of: caption) ?? 0
			}
			.onTapGesture {
				viewRouter.currentCaptionEditingIndex = currIndex
			}
			.gesture(
				DragGesture()
					.onChanged {
						self.currentOffset = $0.translation
					}
					.onEnded { _ in
						self.offset += self.currentOffset
						self.currentOffset = .zero
						meme.captions[currIndex].offset = offset
					}
			)
    }
}

struct FreeTextCaption_Previews: PreviewProvider {
	@State static var caption: Caption = Caption(Constants.Text.defaultCaptionText)
	
    static var previews: some View {
		FreeTextCaption(caption: caption,
						offset: .zero)
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeFreeText())
    }
}
