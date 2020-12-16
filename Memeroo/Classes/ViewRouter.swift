//
//  ViewRouter.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/27/20.
//

import SwiftUI
import Combine

class ViewRouter: ObservableObject {
	@Published var showingMainMenu: Bool = true
	@Published var currentView: TabType = .background
	@Published var showingFocusedImage: Bool = false
	@Published var editingCaption: Bool = false
	@Published var showingPicker: Bool = false
	
	#if DEBUG
	func setCaption() -> Self {
		currentView = .caption
		return self
	}
	#endif
}
