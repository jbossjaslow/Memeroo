//
//  EditSingleCaptionView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 1/13/21.
//

import SwiftUI

struct EditSingleCaptionView: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme

	@State var editingMode: CaptionEditingMode
	@State private var currentText: String = ""
	
	var body: some View {
		VStack(spacing: 0) {
			Spacer()

			VStack {
				TextEditor(text: $currentText)
					.font(.custom(meme.singleCaption.fontFamily,
								  size: meme.singleCaption.fontSize))
					.foregroundColor(meme.singleCaption.fontColor)
					.multilineTextAlignment(meme.alignment)
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
								currentText = meme.singleCaption.text
							case .addingNew:
								currentText = Constants.Text.defaultCaptionText
						}
					}
				
				SingleCaptionEditButtons(caption: $meme.singleCaption)
				
				SingleCaptionExitButtons(currentText: $currentText,
										 editingMode: $editingMode)
			}
			.padding()
			.background(
				RoundedRectangle(cornerRadius: 10)
							.fill(Color.gray)
			)

			Spacer()
			
			Spacer()
		}
		.padding(.horizontal)
		.singleColorBackground(color: Color.black.opacity(0.8))
		.transition(.opacity)
	}
}

struct EditSingleCaptionView_Previews: PreviewProvider {
    static var previews: some View {
        EditSingleCaptionView(editingMode: .editingExisting)
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeFreeText())
    }
}
