//
//  Meme.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/15/20.
//

import SwiftUI

class Meme: ObservableObject {
	@Published var caption: String = "Caption"
	@Published var image: UIImage?
	@Published var renderedImage: UIImage = UIImage()
	
	@Published var fontSize: CGFloat = 14
	@Published var fontColor: Color = Color.TextColors.defaultTextColor
	@Published var fontFamily: String = "system"
	@Published var alignment: TextAlignment = .leading
	
	@Published var captionColor: Color = .white
	
	func renderInternal() {
		guard let memeImage = image else { return }
		self.renderedImage = MemeView.renderMemeView(caption: caption,
									   image: memeImage)
	}
	
	func render() -> UIImage {
		guard let memeImage = image else { return UIImage() }
		return MemeView.renderMemeView(caption: caption,
									   image: memeImage)
	}
}

extension Meme {
	func TestMeme() -> Self {
		caption = "Test Caption"
		image = UIImage(named: "TestImage")
//		render()
		return self
	}
}
