//
//  CaptionAlignmentButton.swift
//  Memeroo
//
//  Created by Josh Jaslow on 1/13/21.
//

import SwiftUI

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

struct CaptionAlignmentButton_Previews: PreviewProvider {
    static var previews: some View {
        CaptionAlignmentButton()
			.environmentObject(Meme())
    }
}
