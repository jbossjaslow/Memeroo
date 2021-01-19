//
//  EditCaptionFontTypeStack.swift
//  Memeroo
//
//  Created by Josh Jaslow on 1/18/21.
//

import SwiftUI

struct EditCaptionFontTypeStack: View {
	
	@Binding var caption: Caption
	
    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			ScrollViewReader { proxy in
				HStack(spacing: 15) {
					Divider()
						.background(Color.TextColors.defaultTextColor)
					
					ForEach(values: Fonts.allFontFamilies) { font in
						Group {
							Text(font)
								.underline(caption.fontFamily == font)
								.font(.custom(font, size: 12))
								.foregroundColor(Color.TextColors.defaultTextColor)
								.onTapGesture {
									caption.fontFamily = font
								}
								.id(font)
							
							Divider()
								.background(Color.TextColors.defaultTextColor)
						}
					}
				}
				.onAppear {
					proxy.scrollTo(caption.fontFamily, anchor: .center)
				}
			}
		}
		.modifier(CaptionsEditButtonsModifier())
    }
}

struct EditCaptionFontTypeStack_Previews: PreviewProvider {
	@State static var caption = Caption.defaultCaption()
	
	static var previews: some View {
		EditCaptionFontTypeStack(caption: $caption)
    }
}
