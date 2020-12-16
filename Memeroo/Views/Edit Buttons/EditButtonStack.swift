//
//  EditButtonStack.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/23/20.
//

import SwiftUI

struct EditButtonStack: View {
	@EnvironmentObject var viewRouter: ViewRouter
	@EnvironmentObject var meme: Meme
	
	@State private var currentSubMenu: EditStackSubMenuType = .none
	@State private var menuHeight: CGFloat = 40
	
	var chooseImage: (() -> Void)? = nil
	
	var body: some View {
		ZStack(alignment: .bottom) {
			HStack {
				switch currentSubMenu {
					case .font: FontTypeView(currentSubMenu: $currentSubMenu,
											 menuHeight: $menuHeight)
					case .size: FontSizeView(currentSubMenu: $currentSubMenu,
											 menuHeight: $menuHeight)
					case .color: FontColorView(currentSubMenu: $currentSubMenu,
											   menuHeight: $menuHeight)
					case .chooseImage: EmptyView()
					case .captionBackgroundColor:
						CaptionBackgroundColorView(currentSubMenu: $currentSubMenu,
												   menuHeight: $menuHeight)
					case .none: EmptyView()
				}
			}
			.background(Color.ViewColors.editButtonBackground)
			.onChange(of: viewRouter.currentView) { _ in
				currentSubMenu = .none
			}
			
			HStack(spacing: 40) {
				switch viewRouter.currentView {
					case .caption:
						MenuButton(buttonType: .font,
								   currentSubMenu: $currentSubMenu)
						
						MenuButton(buttonType: .size,
								   currentSubMenu: $currentSubMenu)
						
						MenuButton(buttonType: .color,
								   currentSubMenu: $currentSubMenu)
						
					case .background:
						MenuButton(buttonType: .chooseImage,
								   currentSubMenu: $currentSubMenu) {
							chooseImage?()
						}
						
						MenuButton(buttonType: .captionBackgroundColor,
								   currentSubMenu: $currentSubMenu)
				}
			}
			.padding(.horizontal, 10)
			.animation(.easeOut)
			//			.shadow(radius: currentSubMenu == .none ? 0 : 1, y: currentSubMenu == .none ? 0 : -1)
			.frame(height: menuHeight)
			.frame(maxWidth: .infinity)
			.background(Color.ViewColors.editButtonBackground)
		}
		.frame(height: menuHeight)
	}
}

struct EditButtonStack_Previews: PreviewProvider {
	static var previews: some View {
		EditButtonStack()
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMeme())
	}
}
