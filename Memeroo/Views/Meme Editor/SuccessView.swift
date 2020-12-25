//
//  SuccessView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/25/20.
//

import SwiftUI

struct SuccessView: View {
	var body: some View {
		VStack {
			Image(systemName: "checkmark")
				.resizable()
				.aspectRatio(contentMode: .fit)
				.foregroundColor(.black)
			Text("Success!")
				.font(.system(size: 28))
				.foregroundColor(.black)
		}
		.transition(.opacity)
		.padding(.vertical)
		.frame(width: 175, height: 175)
		.background(RoundedRectangle(cornerRadius: 20)
						.fill(Color.offWhite))
	}
}

struct SuccessView_Previews: PreviewProvider {
	static var previews: some View {
		SuccessView()
	}
}
