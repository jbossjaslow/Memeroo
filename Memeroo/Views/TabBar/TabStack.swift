//
//  TabStack.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/23/20.
//

import SwiftUI

struct TabStack: View {
	
	@State var geometry: GeometryProxy
	
	var body: some View {
		HStack {
			Spacer()
			
			TabIcon(tabType: .background,
					geometry: geometry)
			
			Spacer()
			
			ShareButton()
//				.offset(y: (-geometry.size.height / 10) / 2)
			Spacer()
			
			TabIcon(tabType: .caption,
					geometry: geometry)
			
			Spacer()
		}
		.padding(.bottom, 5)
		.frame(width: geometry.size.width, height: geometry.size.height/10)
		.background(Color.offWhite.shadow(radius: 2))
	}
}
