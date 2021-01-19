//
//  StrokeColorCaptionButton.swift
//  Memeroo
//
//  Created by Josh Jaslow on 1/18/21.
//

import SwiftUI

struct EditCaptionStrokeStack: View {
	
	@Binding var caption: Caption
	var strokeWidth: String {
		let adjustedWidth = CGFloat(caption.strokeWidth * 10)
		let truncated = String(format: "%.1f", adjustedWidth)
		return "Stroke: \(truncated)"
	}
	
    var body: some View {
		HStack {
			Text(strokeWidth)
			
			Slider(value: $caption.strokeWidth,
				   in: 0...2,
				   step: 0.05)
			
			ColorPicker("Stroke Color",
						selection: $caption.strokeColor)
				.labelsHidden()
				.scaleEffect(1.5)
				.padding(.trailing, 5)
				.padding(.leading, 10)
		}
		.CaptionEditButtonsHStackModifier()
    }
}

struct StrokeColorCaptionButton_Previews: PreviewProvider {
	@State static var caption = Caption.defaultCaption()
	
    static var previews: some View {
		EditCaptionStrokeStack(caption: $caption)
    }
}
