//
//  EditSingleCaptionButton.swift
//  Memeroo
//
//  Created by Josh Jaslow on 1/13/21.
//

import SwiftUI

struct SingleCaptionExitButtons: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@Binding var currentText: String
	@Binding var editingMode: CaptionEditingMode
	
	var body: some View {
		HStack {
			if editingMode == .editingExisting && meme.memeType == .captionAbove {
				CaptionAlignmentButton()
			}
			
			Button {
				if editingMode == .editingExisting {
					meme.singleCaption.text = currentText
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

struct EditSingleCaptionButton_Previews: PreviewProvider {
	@State static var index: Int = 0
	@State static var text = "Test Caption"
	@State static var editingMode: CaptionEditingMode = .addingNew
	
    static var previews: some View {
		SingleCaptionExitButtons(currentText: $text,
								 editingMode: $editingMode)
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeFreeText())
    }
}
