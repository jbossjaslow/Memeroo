//
//  ViewRouter.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/27/20.
//

import SwiftUI
import Combine
import CoreHaptics

class ViewRouter: ObservableObject {
	init() {
		prepareHaptics()
	}
	
	@Published var showingMemeEditor: Bool = false
	@Published var currentTab: TabType = .background
	@Published var showingFocusedImage: Bool = false
	@Published var currentCaptionEditingIndex: Int? = nil
	@Published var showingImageSelector: Bool = false
	@Published var imageSelectionMode: ImageSelectionMode = .imageSelectionAndCropping
	@Published var showingColorSelector: Bool = false
	
	//MARK: - Successful Action Handler
	@Published var showSuccessfulAction: Bool = false
	
	func popSuccess() {
		showSuccessfulAction = true
		ViewRouter.performSimpleHaptics_SimpleSuccess()

		DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
			self.showSuccessfulAction = false
		}
	}
	
	//MARK: - Haptics
	@Published var hapticsEngine: CHHapticEngine?
	
	func prepareHaptics() {
		guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

		do {
			self.hapticsEngine = try CHHapticEngine()
			try hapticsEngine?.start()
		} catch {
			print("There was an error creating the engine: \(error.localizedDescription)")
		}
	}
	
	static func performSimpleHaptics_SelectionChanged() {
		let generator = UISelectionFeedbackGenerator()
		generator.selectionChanged()
	}
	
	static func performSimpleHaptics_ChoseSelection() {
		let generator = UIImpactFeedbackGenerator(style: .medium)
		generator.impactOccurred()
	}
	
	static func performSimpleHaptics_SimpleSuccess() {
		let generator = UINotificationFeedbackGenerator()
		generator.notificationOccurred(.success)
	}
	
	//MARK: - Edit Buttons Menu
	@Published var currentSubMenu: EditStackSubMenuType = .none
	
	func resetToDefault() {
		showingMemeEditor = false
		currentTab = .background
		showingFocusedImage = false
		currentCaptionEditingIndex = nil
		showingImageSelector = false
		imageSelectionMode = .imageSelectionAndCropping
		showingColorSelector = false
		prepareHaptics()
	}
	
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
