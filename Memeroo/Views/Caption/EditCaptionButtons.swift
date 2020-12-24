//
//  EditCaptionButtons.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/26/20.
//

import SwiftUI

struct EditCaptionButtons: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@Binding var captionIndex: Int
	@Binding var currentText: String
	@Binding var editingMode: CaptionEditingMode
	
    var body: some View {
		HStack {
			if editingMode == .editingExisting {
				switch (meme.memeType ?? .captionAbove) {
					case .captionAbove:
						CaptionAlignmentButton()
					case .freeText:
						Button {
							meme.captions.remove(at: captionIndex)
							//
							viewRouter.currentCaptionEditingIndex = nil
						} label: {
							Text("Remove")
								.bold()
								.editCaptionButtonsStyle(Color.red.offLight)
						}
				}
			}
			
			Button {
				switch editingMode {
					case .editingExisting:
						meme.captions[captionIndex].text = currentText
						viewRouter.currentCaptionEditingIndex = nil
					case .addingNew:
						meme.captions.append(Caption(currentText))
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

struct CaptionAlignmentButton: View {
	@EnvironmentObject var meme: Meme
	
	var body: some View {
		Button {
			switch meme.alignment {
				case .leading:
					meme.alignment = .center
				case .center:
					meme.alignment = .trailing
				case .trailing:
					meme.alignment = .leading
			}
		} label: {
			switch meme.alignment {
				case .leading:
					Image(systemName: "text.alignleft")
						.font(.largeTitle)
						.editCaptionButtonsStyle()
				case .center:
					Image(systemName: "text.aligncenter")
						.font(.largeTitle)
						.editCaptionButtonsStyle()
				case .trailing:
					Image(systemName: "text.alignright")
						.font(.largeTitle)
						.editCaptionButtonsStyle()
			}
		}
	}
}

struct EditCaptionButtons_Previews: PreviewProvider {
	@State static var index: Int = 0
	@State static var text = "Test Caption"
	@State static var editingMode: CaptionEditingMode = .editingExisting
	
    static var previews: some View {
		EditCaptionButtons(captionIndex: $index,
						   currentText: $text,
						   editingMode: $editingMode)
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeFreeText())
//			.singleColorBackground(color: Color.black.opacity(0.8))
    }
}
