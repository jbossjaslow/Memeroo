//
//  EditCaptionBackgroundColorStack.swift
//  Memeroo
//
//  Created by Josh Jaslow on 1/18/21.
//

import SwiftUI

struct EditCaptionBackgroundColorStack: View {
	
	@Binding var caption: Caption
	
    var body: some View {
		HStack {
			Text("Caption Background Color")
			
			Spacer()
			
			ColorPicker("Background Color",
						selection: $caption.backgroundColor)
				.labelsHidden()
				.scaleEffect(1.5)
				.padding(.trailing, 5)
				.padding(.leading, 10)
		}
		.CaptionEditButtonsHStackModifier()
    }
}

struct EditCaptionBackgroundColorStack_Previews: PreviewProvider {
	@State static var caption = Caption.defaultCaption()
	
	static var previews: some View {
		EditCaptionBackgroundColorStack(caption: $caption)
    }
}
