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
	@EnvironmentObject var meme: Meme
	
	@State private var currentSubMenu: EditStackSubMenuType = .none
	
    var body: some View {
		ZStack(alignment: .bottom) {
			HStack {
				Spacer()
				switch currentSubMenu {
					case .font: fontTypeView()
					case .size: fontSizeView()
					case .color: fontColorView()
					case .chooseImage: EmptyView()
					case .none: EmptyView()
				}
				Spacer()
			}
			.frame(height: 40)
			.background(Color(.green))
			.offset(y: currentSubMenu == .none ? 0 : -40)
			.animation(currentSubMenu == .none ? .easeIn : .easeOut)
			.onChange(of: viewRouter.currentView, perform: { value in
				currentSubMenu = .none
			})
			
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
	
	private struct fontTypeView: View {
		@EnvironmentObject var meme: Meme
		
		var body: some View {
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 15) {
					Divider()
						.background(Color.TextColors.defaultTextColor)
					
					ForEach(values: Fonts.allFontFamilies) { font in
						Group {
							Text(font)
								.font(.custom(font, size: 12))
								.foregroundColor(Color.TextColors.defaultTextColor)
								.onTapGesture {
									meme.fontFamily = font
								}
							
							Divider()
								.background(Color.TextColors.defaultTextColor)
						}
					}
				}
			}
			.animation(.easeInOut)
			.transition(.move(edge: .bottom))
		}
	}
	
	private struct fontSizeView: View {
		@EnvironmentObject var meme: Meme
		
		var body: some View {
			HStack {
				Text("\(Int(meme.fontSize))")
				
				Slider(value: $meme.fontSize,
					   in: 8...72,
					   step: 2)
			}
			.animation(.easeInOut)
			.transition(.move(edge: .bottom))
		}
	}
	
	private struct fontColorView: View {
		@EnvironmentObject var meme: Meme
		
		var body: some View {
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 15) {
					ForEach(Color.TextColors.colorsList) { color in
						color
							.frame(width: 25, height: 25)
							.border(Color.black, width: 2)
							.onTapGesture {
								meme.fontColor = color
							}
					}
				}
			}
			.animation(.easeInOut)
			.transition(.move(edge: .bottom))
		}
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
			.environmentObject(ViewRouter().setCaption())
			.environmentObject(Meme().TestMeme())
    }
}
