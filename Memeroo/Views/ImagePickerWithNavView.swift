//
//  SelectImageView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/13/20.
//

import SwiftUI

struct SelectImageView: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@State private var showingCropper: Bool = false
	
	var body: some View {
		NavigationView {
			VStack {
				ImagePicker() { showCropper in
					if showCropper {
						showingCropper = true
					} else {
						viewRouter.showingPicker = false
					}
				}
				
				NavigationLink(destination: ImageCropper() { didCancel in
					if didCancel {
						showingCropper = false
					} else {
						viewRouter.showingPicker = false
					}
				},
				isActive: $showingCropper) {
					EmptyView()
				}
			}
			.navigationBarHidden(true)
		}
	}
}

struct SelectImageView_Previews: PreviewProvider {
	static var previews: some View {
		SelectImageView()
			.environmentObject(ViewRouter())
			.environmentObject(Meme())
	}
}
