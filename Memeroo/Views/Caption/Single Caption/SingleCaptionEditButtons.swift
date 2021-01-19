//
//  SingleCaptionEditButtons.swift
//  Memeroo
//
//  Created by Josh Jaslow on 1/13/21.
//

import SwiftUI

struct SingleCaptionEditButtons: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@Binding var caption: Caption
	
    var body: some View {
		VStack {
			EditCaptionTextStack(caption: $caption)
			
			EditCaptionBackgroundColorStack(caption: $caption)
			
			EditCaptionFontTypeStack(caption: $caption)
		}
    }
}

struct SingleCaptionEditButtons_Previews: PreviewProvider {
	@State static var caption = Caption.defaultCaption()
	
    static var previews: some View {
		SingleCaptionEditButtons(caption: $caption)
    }
}
