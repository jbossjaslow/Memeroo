//
//  Meme.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/15/20.
//

import SwiftUI

class Meme: ObservableObject {
	@Published var memeType: MemeType? = nil
	
	@Published var captions: [Caption] = [Caption(Constants.Text.defaultCaptionText)]
	
	@Published var image: UIImage?
	@Published var originalImage: UIImage?
//	@Published private var renderedImage: UIImage = UIImage()
	
	@Published var fontSize: CGFloat = 14
	@Published var fontColor: Color = .black
	@Published var fontFamily: String = "system"
	@Published var alignment: TextAlignment = .leading
	
	@Published var fontStrokeColor: Color? = nil
//	@Published var fontStrokeWidth: CGFloat = 0
	
	@Published var captionBackgroundColor: Color = .white
	
	func render() -> UIImage? {
		guard image != nil,
			  let type = memeType else { return nil }
		switch type {
			case .captionAbove:
				return CaptionAboveMemeView()
					.environmentObject(self)
					.asImage(completion: nil)
			case .freeText:
				return FreeTextMemeView()
					.environmentObject(self)
					.asImage(completion: nil)
		}
	}
	
	func setup(type: MemeType) {
		resetToDefault()
		memeType = type
		switch memeType {
			case .captionAbove:
				captions = [Caption(Constants.Text.defaultCaptionText)]
			case .freeText:
				captions = []
			default:
				return
		}
	}
	
	func resetToDefault() {
		memeType = nil
		captions = [Caption(Constants.Text.defaultCaptionText)]
		image = nil
		fontSize = 14
		fontColor = .black
		fontFamily = "system"
		alignment = .leading
		captionBackgroundColor = .white
		fontStrokeColor = nil
	}
}

extension Meme {
	func TestMemeCaptionAbove() -> Self {
		setup(type: .captionAbove)
		captions = [Caption("Test Caption")]
		image = UIImage(named: "TestImage")
		memeType = .captionAbove
		return self
	}
	
	func TestMemeFreeText() -> Self {
		setup(type: .freeText)
		captions = [Caption("Top text"), Caption("Bottom text")]
		image = UIImage(named: "TestImage")
		memeType = .freeText
		fontStrokeColor = .black
//		fontStrokeWidth = 0.5
		fontColor = .white
		return self
	}
}
