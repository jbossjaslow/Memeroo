//
//  ImageCropper.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/15/20.
//

import SwiftUI
import TOCropViewController

struct ImageCropper: UIViewControllerRepresentable {
	@EnvironmentObject var meme: Meme
	
	let dismissFuncShouldShowCropper: (Bool) -> Void
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	func makeUIViewController(context: UIViewControllerRepresentableContext<ImageCropper>) -> TOCropViewController {
		let vc = TOCropViewController(image: meme.image ?? UIImage())
		vc.delegate = context.coordinator
		return vc
	}
	
	func updateUIViewController(_ uiViewController: TOCropViewController, context: UIViewControllerRepresentableContext<ImageCropper>) {}
	
	class Coordinator: NSObject,
					   TOCropViewControllerDelegate {
		let parent: ImageCropper
		
		init(_ parent: ImageCropper) {
			self.parent = parent
		}
		
		func cropViewController(_ cropViewController: TOCropViewController,
								didFinishCancelled cancelled: Bool) {
			parent.dismissFuncShouldShowCropper(false)
		}
		
		func cropViewController(_ cropViewController: TOCropViewController,
								didCropTo image: UIImage,
								with cropRect: CGRect,
								angle: Int) {
			parent.meme.image = image
			parent.dismissFuncShouldShowCropper(false)
		}
	}
}

struct ImageCropper_Previews: PreviewProvider {
	static var previews: some View {
		ImageCropper(dismissFuncShouldShowCropper: test(param:))
			.environmentObject(Meme())
	}
	
	static func test(param: Bool) {
		print("Testing")
	}
}
