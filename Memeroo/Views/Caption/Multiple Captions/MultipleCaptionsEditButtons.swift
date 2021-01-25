//
//  MultipleCaptionsEditButtons.swift
//  Memeroo
//
//  Created by Josh Jaslow on 1/13/21.
//

import SwiftUI

struct MultipleCaptionsEditButtons: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@Binding var caption: Caption
	
    var body: some View {
		VStack {
			EditCaptionTextStack(caption: $caption)
			
			EditCaptionStrokeStack(caption: $caption)
			
			EditCaptionFontTypeStack(caption: $caption)
		}
    }
}

struct MultipleCaptionsEditButtons_Previews: PreviewProvider {
	@State static var caption = Caption.defaultCaption()
	
    static var previews: some View {
        MultipleCaptionsEditButtons(caption: $caption)
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeFreeStyle())
    }
}
