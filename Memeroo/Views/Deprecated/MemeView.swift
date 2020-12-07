//
//  MemeView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/15/20.
//

import SwiftUI

struct MemeView {
	static func renderMemeView(_ meme: Meme) -> UIImage {
		let stack = VStack(spacing: 0) {
			HStack {
				if meme.alignment != .leading {
					Spacer()
				}
				
				Text(meme.caption)
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
			
			Image(uiImage: meme.image!)
				.resizable()
				.scaledToFit()
		}
		.padding(.horizontal)
		
		return stack.asImage(completion: {})
	}
}
