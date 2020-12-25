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
	
	@State var selectionMode: ImageSelectionMode
	@State private var showingCropper: Bool = false
	
	var body: some View {
		NavigationView {
			VStack {
				switch selectionMode {
					case .imageSelectionAndCropping:
						ImagePicker() { showCropper in
							if showCropper {
								showingCropper = true
							} else {
								viewRouter.showingImageSelector = false
							}
						}
						
						NavigationLink(destination: ImageCropper() { didCancel in
							if didCancel {
								showingCropper = false
							} else {
								viewRouter.showingImageSelector = false
							}
						},
						isActive: $showingCropper) {
							EmptyView()
						}
					case .cropOnly:
						ImageCropper() { _ in
							viewRouter.showingImageSelector = false
						}
				}
			}
			.navigationBarHidden(true)
		}
	}
}

struct SelectImageView_Previews: PreviewProvider {
	static var previews: some View {
		SelectImageView(selectionMode: .imageSelectionAndCropping)
			.environmentObject(ViewRouter())
			.environmentObject(Meme())
	}
}
