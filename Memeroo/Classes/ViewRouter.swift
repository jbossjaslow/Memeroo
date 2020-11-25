//
//  ViewRouter.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/27/20.
//

import SwiftUI
import Combine

class ViewRouter: ObservableObject {
	@Published var currentView: TabType = .background
	@Published var showingFocusedImage: Bool = false
	
	#if DEBUG
	func setCaption() -> Self {
		currentView = .caption
		return self
	}
	#endif
}
