//
//  CaptureViewContextExtension.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/15/20.
//

import SwiftUI

extension View {
	func asImage(completion: () -> Void) -> UIImage {
		let controller = UIHostingController(rootView: self)

		// locate far out of screen
		controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 0, height: 0)
		UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)

		let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
		controller.view.bounds = CGRect(origin: .zero, size: size)
		controller.view.sizeToFit()

		let image = controller.view.asImage() {
			completion()
		}
		controller.view.removeFromSuperview()
		return image
	}
}

extension UIView {
	func asImage(completion: () -> Void) -> UIImage {
		//remove 1 pixel of white space from right edge of image
		let adjustedBounds = CGRect(x: 0,
									y: 0,
									width: bounds.width - 1,
									height: bounds.height - 1)
		let renderer = UIGraphicsImageRenderer(bounds: adjustedBounds)
		return renderer.image { rendererContext in
// [!!] Uncomment to clip resulting image
//             rendererContext.cgContext.addPath(
//                UIBezierPath(roundedRect: bounds, cornerRadius: 20).cgPath)
//            rendererContext.cgContext.clip()

// In some cases might be needed to make this asynchronously,
// so uncomment below DispatchQueue if you'd same met crash
//            DispatchQueue.main.async {
			layer.render(in: rendererContext.cgContext)
			completion()
//            }
		}
	}
}
