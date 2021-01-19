//
//  EditMultiCaptionsButton.swift
//  Memeroo
//
//  Created by Josh Jaslow on 1/13/21.
//

import SwiftUI

struct MultipleCaptionsExitButtons: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@Binding var caption: Caption
	@Binding var captionIndex: Int?
	@Binding var currentText: String
	@Binding var editingMode: CaptionEditingMode
	
	var body: some View {
		HStack {
			if editingMode == .editingExisting && meme.memeType == .freeText {
				Button {
					if let index = meme.multiCaptions.firstIndex(of: caption) {
						meme.multiCaptions.remove(at: index)
						//
						viewRouter.currentCaptionEditingIndex = nil
					}
				} label: {
					Text("Remove")
						.bold()
						.editCaptionButtonsStyle(Color.red.offLight)
				}
			}
			
			Button {
				switch editingMode {
					case .editingExisting:
						if let index = captionIndex,
						   index < meme.multiCaptions.count {
							caption.text = currentText
							viewRouter.currentCaptionEditingIndex = nil
							meme.multiCaptions[index] = caption
						}
					case .addingNew:
						caption.text = currentText
						meme.multiCaptions.append(caption)
						viewRouter.currentCaptionEditingIndex = nil
				}
			} label: {
				Text("Done")
					.bold()
					.editCaptionButtonsStyle()
			}
			
			Button {
				viewRouter.currentCaptionEditingIndex = nil
			} label: {
				Text("Cancel")
					.bold()
					.editCaptionButtonsStyle()
			}
		}
	}
}

struct EditMultipleCaptionsButtons_Previews: PreviewProvider {
	@State static var caption: Caption = Caption.defaultCaption()
	@State static var text = "Test Caption"
	@State static var captionIndex: Int? = 0
	@State static var editingMode: CaptionEditingMode = .editingExisting
	
	static var previews: some View {
		MultipleCaptionsExitButtons(caption: $caption,
									captionIndex: $captionIndex,
									currentText: $text,
									editingMode: $editingMode)
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeFreeText())
		//			.singleColorBackground(color: Color.black.opacity(0.8))
	}
}
