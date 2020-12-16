//
//  MenuButton.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/16/20.
//

import SwiftUI

struct MenuButton: View {
	var buttonType: EditStackSubMenuType
	@Binding var currentSubMenu: EditStackSubMenuType
	
	var chooseImage: (() -> Void)? = nil
	
	var body: some View {
		Button {
			withAnimation {
				if buttonType == .chooseImage  {
					currentSubMenu = .none
					chooseImage?()
				}
				else if currentSubMenu == buttonType {
					currentSubMenu = .none
				} else {
					currentSubMenu = buttonType
				}
			}
		} label: {
			Text(buttonType.rawValue)
		}
	}
}

struct MenuButton_Previews: PreviewProvider {
	@State static var subMenu: EditStackSubMenuType = .font
	
    static var previews: some View {
		MenuButton(buttonType: .color,
				   currentSubMenu: $subMenu)
    }
}
