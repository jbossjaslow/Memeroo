//
//  MemeProcessTabView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/23/20.
//

import SwiftUI

struct MemeProcessTabView: View {
	@EnvironmentObject var meme: Meme
	
	@State var selectedView = 0
	
	var body: some View {
		TabView(selection: $selectedView) {
			ImageSelectionView()
				.tabItem {
					Image(systemName: "photo")
					Text("Image")
				}
				.tag(0)
			
			EditCaptionView()
				.tabItem {
					Image(systemName: "captions.bubble")
					Text("Caption")
				}
				.tag(1)
			
			ShareSheetView()
				.tabItem {
					Image(systemName: "square.and.arrow.up")
					Text("Share")
				}
				.tag(2)
				.onChange(of: selectedView, perform: { value in
					if value == 2 {
						meme.renderInternal()
					}
				})
		}
	}
}

struct MemeProcessTabView_Previews: PreviewProvider {
	static var previews: some View {
		MemeProcessTabView()
			.environmentObject(Meme().TestMeme())
	}
}
