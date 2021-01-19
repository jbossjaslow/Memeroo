//
//  MainMenu.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/16/20.
//

import SwiftUI

struct MainMenu: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@State private var selection: Int = 0
	@State private var memerooTitle = Caption("Memeroo",
											  size: 80,
											  fontColor: .myPink,
											  strokeColor: .black,
											  strokeWidth: 1)
	
	var body: some View {
		VStack {
			
			Text(memerooTitle.text)
//				.font(.system(size: 30, weight: .regular, design: .serif))
				.font(.custom("Chalkboard SE", size: memerooTitle.fontSize))
				.foregroundColor(.myPink)
				.addTextStroke(caption: memerooTitle,
							   .black)
			
			Spacer()
			
//			Text("Select Meme Type")
			
			TabView(selection: $selection) {
				ForEachWithIndex(MemeType.allCases) { index, memeType in
					MemeTypePreview(type: memeType)
						.tag(index)
						.environmentObject(meme)
				}
			}
			.tabViewStyle(PageTabViewStyle())
			.indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
			.frame(height: 380)
			.onChange(of: selection) { _ in
				ViewRouter.performSimpleHaptics_SelectionChanged()
			}
			.colorScheme(.dark)
			
			Spacer()
			
			Spacer()
			
			Text("Made by Josh Jaslow")
				.foregroundColor(.black)
		}
		.singleColorBackground(color: .offWhite)
	}
}

struct MainMenu_Previews: PreviewProvider {
	static var previews: some View {
		MainMenu()
			.environmentObject(ViewRouter())
			.environmentObject(Meme())
	}
}
