//
//  MemeView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/15/20.
//

import SwiftUI

struct MemeView {
	static func renderMemeView(caption: String,
							   image: UIImage) -> UIImage {
		let stack = VStack(spacing: 0) {
			HStack {
				Text(caption)
					.font(.system(size: 14))
					.foregroundColor(.black)
					.frame(height: 50)
					.padding(.horizontal, 10)
					.background(Color.white)
				
				Spacer()
			}
			
			Image(uiImage: image)
				.resizable()
				.scaledToFit()
		}
		
		return stack.asImage()
	}
}
