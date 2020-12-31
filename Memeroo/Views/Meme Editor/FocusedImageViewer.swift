//
//  FocusedImageViewer.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/21/20.
//

import SwiftUI

struct FocusedImageViewer: View {
	@EnvironmentObject var viewRouter: ViewRouter
	
	@State var image: Image
	
	//Offset
	@State private var currentOffset: CGSize = .zero
	@State private var finalOffset: CGSize = .zero
	private var offset: CGSize {
		return currentOffset + finalOffset
	}
	@State private var offsetAnimationDuration: Double = 0
	
	//Magnification
	@State private var currentScale: CGFloat = 0
	@State private var finalScale: CGFloat = 1
	private var scale: CGFloat {
		return currentScale + finalScale
	}
	
	var body: some View {
		VStack {
			Spacer()
			
			image
				.resizable()
				.aspectRatio(contentMode: .fit)
				.offset(offset)
				.scaleEffect(scale)
				.animation(.easeOut(duration: offsetAnimationDuration))
				.gesture(
					DragGesture()
						.onChanged { gesture in
							self.currentOffset = gesture.translation
							offsetAnimationDuration = 0
						}
						
						.onEnded { gesture in
							self.finalOffset += self.currentOffset
							self.currentOffset = .zero
							offsetAnimationDuration = 0.25
							
							if distance(finalOffset) > 150 {
								withAnimation {
									viewRouter.showingFocusedImage = false
								}
							}
							
							if scale == 1 {
								self.finalOffset = .zero
							} else {
								self.finalOffset.width = setWidth(endX: finalOffset.width)
								self.finalOffset.height = 0
							}
						}
				)
				.gesture(
					MagnificationGesture()
						.onChanged { value in
							self.currentScale = value.magnitude - 1
						}
						.onEnded { value in
							self.finalScale += self.currentScale
							self.currentScale = 0
							
							if finalScale > 3 {
								finalScale = 3
							} else if finalScale < 1 {
								finalScale = 1
								finalOffset = .zero
								currentOffset = .zero
							}
						}
				)
				.runNothingOnSpacerTap()
			
			Spacer()
		}
		.singleColorBackground(color: Color.black.opacity(0.8))
		.transition(.opacity)
		.runOnSpacerTap() {
			viewRouter.showingFocusedImage = false
		}
	}
	
	private func setWidth(endX: CGFloat) -> CGFloat {
		let screenWidth = UIScreen.main.bounds.size.width
		if endX.magnitude > screenWidth / 4 {
			return (screenWidth / 4) * (endX / endX.magnitude)
		} else {
			print("Returning endX")
			return endX
		}
	}
	
	private func distance(_ offset: CGSize) -> CGFloat {
		let a2 = offset.width * offset.width
		let b2 = offset.height * offset.height
		return sqrt(a2 + b2)
	}
}

struct FocusedImageViewer_Previews: PreviewProvider {
	static var previews: some View {
		FocusedImageViewer(image: Image("TestImage"))
		.environmentObject(ViewRouter())
	}
}
