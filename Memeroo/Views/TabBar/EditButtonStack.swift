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
	
	var chooseImage: (() -> Void)? = nil
	
    var body: some View {
		ZStack(alignment: .bottom) {
			HStack {
				Spacer()
				switch currentSubMenu {
					case .font: fontTypeView()
					case .size: fontSizeView()
					case .color: fontColorView()
					case .chooseImage: EmptyView()
					case .captionBackgroundColor:
						captionBackgroundColorView(blackLevel: meme.captionColor.red)
					case .none: EmptyView()
				}
				Spacer()
			}
			.frame(height: 40)
			.background(Color.white)
			.offset(y: currentSubMenu == .none ? 0 : -40)
			.animation(currentSubMenu == .none ? .easeIn : .easeOut)
			.onChange(of: viewRouter.currentView) { _ in
				currentSubMenu = .none
			}
			
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
								   currentSubMenu: $currentSubMenu) {
							chooseImage?()
						}
						
						MenuButton(buttonType: .captionBackgroundColor,
								   currentSubMenu: $currentSubMenu)
				}
				
				Spacer()
			}
			.frame(height: 40)
			.background(Color.white)
			.animation(.easeOut)
			.shadow(radius: currentSubMenu == .none ? 0 : 1, y: currentSubMenu == .none ? 0 : -1)
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
	
	private struct captionBackgroundColorView: View {
		@EnvironmentObject var meme: Meme
		@State var blackLevel: Double
		
		var body: some View {
			HStack {
				meme.captionColor
					.frame(width: 25, height: 25)
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
			.animation(.easeInOut)
			.transition(.move(edge: .bottom))
		}
	}
	
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
			.environmentObject(ViewRouter().setCaption())
			.environmentObject(Meme().TestMeme())
    }
}
