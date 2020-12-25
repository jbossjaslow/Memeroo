//
//  ViewRouter.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/27/20.
//

import SwiftUI
import Combine

class ViewRouter: ObservableObject {
	@Published var showingMemeEditor: Bool = false
	@Published var currentTab: TabType = .background
	@Published var showingFocusedImage: Bool = false
	@Published var currentCaptionEditingIndex: Int? = nil
	@Published var showingImageSelector: Bool = false
	@Published var imageSelectionMode: ImageSelectionMode = .imageSelectionAndCropping
	
	//MARK: - Edit Buttons Menu
	@Published var currentSubMenu: EditStackSubMenuType = .none
	
	#if DEBUG
	func setCaption() -> Self {
		currentTab = .caption
		return self
	}
	
	func setSubMenu(_ menu: EditStackSubMenuType) -> Self {
		currentSubMenu = menu
		return self
	}
	#endif
}
