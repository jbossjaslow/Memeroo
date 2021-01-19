//
//  EditCaptionTextStack.swift
//  Memeroo
//
//  Created by Josh Jaslow on 1/18/21.
//

import SwiftUI

struct EditCaptionTextStack: View {
	
	@Binding var caption: Caption
	
    var body: some View {
		HStack {
			Text("Font: \(Int(caption.fontSize))")
			
			Slider(value: $caption.fontSize,
				   in: 8...54,
				   step: 2)
			
			ColorPicker("Text Color",
						selection: $caption.fontColor)
				.labelsHidden()
				.scaleEffect(1.5)
				.padding(.trailing, 5)
				.padding(.leading, 10)
		}
		.CaptionEditButtonsHStackModifier()
    }
}

struct EditCaptionTextStack_Previews: PreviewProvider {
	@State static var caption = Caption.defaultCaption()
	
	static var previews: some View {
		EditCaptionTextStack(caption: $caption)
    }
}
