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
					case .font: fontTypeView(currentSubMenu: $currentSubMenu,
											 menuHeight: $menuHeight)
					case .size: fontSizeView(currentSubMenu: $currentSubMenu,
											 menuHeight: $menuHeight)
					case .color: fontColorView(currentSubMenu: $currentSubMenu,
											   menuHeight: $menuHeight)
					case .chooseImage: EmptyView()
					case .captionBackgroundColor:
						captionBackgroundColorView(blackLevel: meme.captionColor.red,
												   currentSubMenu: $currentSubMenu,
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
	
	//MARK: - Sub Menus
	private struct fontTypeView: View {
		@EnvironmentObject var meme: Meme
		@Binding var currentSubMenu: EditStackSubMenuType
		@Binding var menuHeight: CGFloat
		
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
			.padding(.horizontal, 10)
			.frame(height: menuHeight)
			.background(Color.ViewColors.editButtonBackground)
			.offset(y: currentSubMenu == .none ? 0 : -menuHeight)
			.animation(currentSubMenu == .none ? .easeIn : .easeOut)
			.transition(.move(edge: .bottom))
		}
	}
	
	private struct fontSizeView: View {
		@EnvironmentObject var meme: Meme
		@Binding var currentSubMenu: EditStackSubMenuType
		@Binding var menuHeight: CGFloat
		
		var body: some View {
			HStack {
				Text("\(Int(meme.fontSize))")
				
				Slider(value: $meme.fontSize,
					   in: 8...54,
					   step: 2)
			}
			.padding(.horizontal, 10)
			.frame(height: menuHeight)
			.background(Color.ViewColors.editButtonBackground)
			.offset(y: currentSubMenu == .none ? 0 : -menuHeight)
			.animation(currentSubMenu == .none ? .easeIn : .easeOut)
			.transition(.move(edge: .bottom))
		}
	}
	
	private struct fontColorView: View {
		@EnvironmentObject var meme: Meme
		@Binding var currentSubMenu: EditStackSubMenuType
		@Binding var menuHeight: CGFloat
		
		var body: some View {
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: 15) {
					ForEach(Color.TextColors.colorsList) { color in
						color
							.frame(width: 30, height: 30)
							.border(Color.TextColors.defaultTextColor, width: 2)
							.onTapGesture {
								meme.fontColor = color
							}
					}
				}
			}
			.padding(.horizontal, 10)
			.frame(height: menuHeight)
			.background(Color.ViewColors.editButtonBackground)
			.offset(y: currentSubMenu == .none ? 0 : -menuHeight)
			.animation(currentSubMenu == .none ? .easeIn : .easeOut)
			.transition(.move(edge: .bottom))
		}
	}
	
	private struct captionBackgroundColorView: View {
		@EnvironmentObject var meme: Meme
		@State var blackLevel: Double
		@Binding var currentSubMenu: EditStackSubMenuType
		@Binding var menuHeight: CGFloat
		
		var body: some View {
			HStack {
				meme.captionColor
					.frame(width: 30, height: 30)
					.border(Color.black, width: 2)
				
				Slider(value: $blackLevel,
					   in: 0...1.0,
					   step: 0.05)
					.onChange(of: blackLevel) { _ in
						meme.captionColor = Color(red: blackLevel,
												  green: blackLevel,
												  blue: blackLevel)
					}
			}
			.padding(.horizontal, 10)
			.frame(height: menuHeight)
			.background(Color.ViewColors.editButtonBackground)
			.offset(y: currentSubMenu == .none ? 0 : -menuHeight)
			.animation(currentSubMenu == .none ? .easeIn : .easeOut)
			.transition(.move(edge: .bottom))
		}
	}
	
	//MARK: - Menu Button
	private struct MenuButton: View {
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
}

struct EditButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        EditButtonStack()
			.environmentObject(ViewRouter())
			.environmentObject(Meme().TestMeme())
    }
}
