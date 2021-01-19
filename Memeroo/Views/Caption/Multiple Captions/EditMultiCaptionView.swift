//
//  EditMultiCaptionView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 1/13/21.
//

import SwiftUI

struct EditMultiCaptionView: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@State var caption: Caption
	@State var captionIndex: Int?
	@State var editingMode: CaptionEditingMode
	@State private var currentText: String = ""
	
	var body: some View {
		VStack(spacing: 0) {
			Spacer()

			VStack {
				TextEditor(text: $currentText)
					.font(.custom(caption.fontFamily,
								  size: caption.fontSize))
					.foregroundColor(caption.fontColor)
					.addTextStroke(caption: caption)
					.lineLimit(7)
					.frame(height: 200)
					.unableToEndEditing()
					.cornerRadius(10)
					.background(
						RoundedRectangle(cornerRadius: 10)
							.stroke(Color.black, lineWidth: 2)
					)
					.onAppear {
						switch editingMode {
							case .editingExisting:
								currentText = caption.text
							case .addingNew:
								currentText = Constants.Text.defaultCaptionText
						}
					}
				
				MultipleCaptionsEditButtons(caption: $caption)
				
				MultipleCaptionsExitButtons(caption: $caption,
											captionIndex: $captionIndex,
											currentText: $currentText,
											editingMode: $editingMode)
			}
			.padding()
			.background(
				RoundedRectangle(cornerRadius: 10)
							.fill(Color.gray)
			)
//			.runNothingOnSpacerTap()

			Spacer()
			
			Spacer()
		}
		.padding(.horizontal)
		.singleColorBackground(color: Color.black.opacity(0.8))
		.transition(.opacity)
//		.runOnSpacerTap() {
//			viewRouter.currentCaptionEditingIndex = nil
//		}
	}
}

struct EditMultiCaptionView_Previews: PreviewProvider {
    static var previews: some View {
		EditMultiCaptionView(caption: Caption.defaultCaption(),
							 editingMode: .editingExisting)
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeFreeText())
    }
}
