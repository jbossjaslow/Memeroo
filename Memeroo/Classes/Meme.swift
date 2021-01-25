//
//  Meme.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/15/20.
//

import SwiftUI

class Meme: ObservableObject {
	@Published var memeType: MemeType? = nil
	
	@Published var image: UIImage?
	@Published var originalImage: UIImage?
//	@Published private var renderedImage: UIImage = UIImage()
	
	//MARK: - SingleMemeValues
	@Published var singleCaption: Caption = Caption.defaultCaption()
	@Published var alignment: TextAlignment = .leading
	
	//MARK: - MultiMemeValues
	@Published var multiCaptions: [Caption] = [Caption.defaultCaption()]
	
	func render() -> UIImage? {
		switch memeType {
			case .captionAbove:
				guard image != nil,
					  !singleCaption.text.isEmpty else { return nil }
				return CaptionAboveMemeView()
					.environmentObject(self)
					.asImage()
			case .freeStyle:
				guard image != nil,
					  !multiCaptions.isEmpty else { return nil }
				return FreeStyleMemeView()
					.environmentObject(self)
					.asImage()
			default:
				return nil
		}
	}
	
	func setup(type: MemeType) {
		resetToDefault()
		memeType = type
		switch memeType {
			case .captionAbove:
				singleCaption = Caption.defaultCaption()
			case .freeStyle:
				multiCaptions = []
			default:
				return
		}
	}
	
	func resetToDefault() {
		memeType = nil
		singleCaption = Caption.defaultCaption()
		multiCaptions = [Caption.defaultCaption()]
		image = nil
		alignment = .leading
	}
}

extension Meme {
	func TestMemeCaptionAbove(_ captionText: String = "Test Caption") -> Self {
		setup(type: .captionAbove)
		singleCaption = Caption(captionText)
		image = UIImage(named: "TestImage")
		memeType = .captionAbove
		return self
	}
	
	func TestMemeFreeStyle() -> Self {
		setup(type: .freeStyle)
		multiCaptions = [Caption("Top text",
								 fontColor: .white),
						 Caption("Bottom text",
								 fontColor: .white)]
		image = UIImage(named: "TestImage")
		memeType = .freeStyle
		return self
	}
	
	func setPreviewTestMemeCaptions() -> Self {
		return self
	}
}
