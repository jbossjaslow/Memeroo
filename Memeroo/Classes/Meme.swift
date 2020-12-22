//
//  Meme.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/15/20.
//

import SwiftUI

class Meme: ObservableObject {
	@Published var memeType: MemeType? = nil
	
	@Published var captions: [String] = [Constants.Text.defaultCaptionText]
	@Published var image: UIImage?
	@Published private var renderedImage: UIImage = UIImage()
	
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
	
	func setup(type: MemeType) {
		resetToDefault()
		memeType = type
		switch memeType {
			case .captionAbove:
				captions = [Constants.Text.defaultCaptionText]
			case .freeText:
				captions = []
			default:
				return
		}
	}
	
	func resetToDefault() {
		memeType = nil
		captions = [Constants.Text.defaultCaptionText]
		image = nil
		fontSize = 14
		fontColor = .black
		fontFamily = "system"
		alignment = .leading
		captionColor = .white
		renderingImage = false
		currentMemeView = nil
	}
}

extension Meme {
	func TestMemeCaptionAbove() -> Self {
		captions = ["Test Caption"]
		image = UIImage(named: "TestImage")
		memeType = .captionAbove
		return self
	}
	
	func TestMemeFreeText() -> Self {
		captions = ["Top text", "Bottom text"]
		image = UIImage(named: "TestImage")
		memeType = .freeText
		return self
	}
}
