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
	
	@Binding var currentText: String
	
    var body: some View {
		HStack {
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
			
			Button {
				meme.caption = currentText
				self.viewRouter.editingCaption = false
			} label: {
				Text("Done")
					.bold()
					.editCaptionButtonsStyle()
			}
			
			Button {
				self.viewRouter.editingCaption = false
			} label: {
				Text("Cancel")
					.bold()
					.editCaptionButtonsStyle()
			}
		}
    }
}

struct EditCaptionButtons_Previews: PreviewProvider {
	@State static var text = "Test Caption"
	
    static var previews: some View {
		EditCaptionButtons(currentText: $text)
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMeme())
    }
}
