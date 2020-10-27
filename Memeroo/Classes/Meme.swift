//
//  Meme.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/15/20.
//

import SwiftUI

class Meme: ObservableObject {
	@Published var caption: String = ""
	@Published var image: UIImage?
	@Published var renderedImage: UIImage = UIImage()
	
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
