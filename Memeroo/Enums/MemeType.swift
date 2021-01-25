//
//  MemeType.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/16/20.
//

import Foundation

enum MemeType: String, CaseIterable {
	//MARK: - Caption outside the image memes
	case captionAbove = "Caption Above"
	case captionBelow = "Caption Below"
	
	//MARK: - Free style memes
	case freeStyle = "Free Style"
	case fixedCaptionTopBottom = "Fixed Caption on the Top and Bottom"
	case verticalImageStack = "Vertical Image Stack"
	case horizontalImageStack = "HorizontalImageStack"
}

extension MemeType: Identifiable {
	var id: MemeType { self }
}
