//
//  FreeStyleCaption.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/21/20.
//

import SwiftUI

struct FreeStyleCaption: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@State var caption: Caption
	@State private var currentOffset: CGSize = .zero
	@State var offset: CGSize
	
	@State private var currIndex: Int = 0
	
    var body: some View {
		Text(caption.text)
			.font(.custom(caption.fontFamily,
						  size: caption.fontSize))
			.foregroundColor(caption.fontColor)
			.addTextStroke(caption: caption)
			.animation(nil)
			.offset(offset + currentOffset)
			.onAppear {
				currIndex = meme.multiCaptions.firstIndex(of: caption) ?? 0
			}
			.gesture(
				DragGesture()
					.onChanged {
						currentOffset = $0.translation
					}
					.onEnded { _ in
						offset += currentOffset
						currentOffset = .zero
						meme.multiCaptions[currIndex].offset = offset
					}
			)
			.onTapGesture {
				//having onTapGesture before the drag gesture caused there to be a delay before the drag movement showed
				viewRouter.currentCaptionEditingIndex = currIndex
			}
    }
}

struct FreeStyleCaption_Previews: PreviewProvider {
	@State static var caption: Caption = Caption(Constants.Text.defaultCaptionText,
												 size: 54)
	
    static var previews: some View {
		FreeStyleCaption(caption: caption,
						offset: .zero)
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeFreeStyle())
    }
}
