//
//  SwiftUIView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/26/20.
//

import SwiftUI

struct EditCaptionView: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@State var captionIndex: Int
	@State var editingMode: CaptionEditingMode
	@State private var currentText: String = ""
	
	var body: some View {
		VStack(spacing: 0) {
			Spacer()

			VStack {
				TextEditor(text: $currentText)
					.multilineTextAlignment(meme.alignment)
					.foregroundColor(Color.TextColors.defaultTextColor)
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
								currentText = meme.captions[captionIndex].text
							case .addingNew:
								currentText = Constants.Text.defaultCaptionText
						}
					}
				
				EditCaptionButtons(captionIndex: $captionIndex,
								   currentText: $currentText,
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
		.ableToEndEditing()
	}
}

struct SwiftUIView_Previews: PreviewProvider {
	static var previews: some View {
		EditCaptionView(captionIndex: 0,
						editingMode: .editingExisting)
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMemeFreeText())
	}
}
