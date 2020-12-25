//
//  MemeTypePreview.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/25/20.
//

import SwiftUI

struct MemeTypePreview: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@State var type: MemeType
	
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 25)
				.fill(Color.offWhite)
				.frame(height: 200)
				.padding(.horizontal)
			
			Text(type.rawValue)
		}
		.contentShape(RoundedRectangle(cornerRadius: 25))
		.onTapGesture {
			ViewRouter.performSimpleHaptics_ChoseSelection()
			meme.setup(type: type)
			viewRouter.showingMemeEditor = true
		}
    }
}

struct MemeTypePreview_Previews: PreviewProvider {
    static var previews: some View {
		MemeTypePreview(type: .captionAbove)
			.environmentObject(ViewRouter())
			.environmentObject(Meme())
    }
}
