//
//  EditButtonStack.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/23/20.
//

import SwiftUI

enum EditStackSubMenuType: String {
	case font = "Font"
	case size = "Size"
	case color = "Color"
	case chooseImage = "Choose Image"
	case none = ""
}

struct EditButtonStack: View {
	@EnvironmentObject var viewRouter: ViewRouter
	
	@State private var currentSubMenu: EditStackSubMenuType = .none
	
    var body: some View {
		ZStack(alignment: .bottom) {
			HStack {
				Spacer()
				Text("SubMenu: \(currentSubMenu.rawValue)")
				Spacer()
			}
			.frame(height: 40)
			.background(Color(.green))
			.offset(y: currentSubMenu == .none ? 0 : -40)
			.animation(currentSubMenu == .none ? .easeIn : .easeOut)
			
			HStack(spacing: 40) {
				Spacer()
				
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
								   currentSubMenu: $currentSubMenu)
				}
				
				Spacer()
			}
			.frame(height: 40)
			.background(Color.white)
			.animation(.easeOut)
		}
		.frame(height: 40)
    }
	
	private struct MenuButton: View {
		var buttonType: EditStackSubMenuType
		@Binding var currentSubMenu: EditStackSubMenuType
		
		var body: some View {
			Button {
				withAnimation {
					if currentSubMenu == buttonType {
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
}

struct EditButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        EditButtonStack()
			.environmentObject(ViewRouter())
    }
}
