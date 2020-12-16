//
//  Meme.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/15/20.
//

import SwiftUI

class Meme: ObservableObject {
	@Published var caption: String = Constants.defaultCaptionText
	@Published var image: UIImage?
	@Published var renderedImage: UIImage = UIImage()
	
	@Published var fontSize: CGFloat = 14
	@Published var fontColor: Color = .black
	@Published var fontFamily: String = "system"
	@Published var alignment: TextAlignment = .leading
	
	@Published var captionColor: Color = .white
	
	@Published var renderingImage: Bool = false
	var currentMemeView: AnyView?
	
	func render() -> UIImage {
		guard image != nil,
			  let currView = currentMemeView else { return UIImage() }
		renderingImage = true
		return currView.asImage() {
			renderingImage = false
		}
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
