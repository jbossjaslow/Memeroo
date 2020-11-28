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
		guard image != nil else { return }
		self.renderedImage = MemeView.renderMemeView(self)
	}
	
	func render() -> UIImage {
		guard image != nil else { return UIImage() }
		return MemeView.renderMemeView(self)
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
