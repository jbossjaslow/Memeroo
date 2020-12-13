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
	
	var dismiss: ((Bool) -> Void)? = nil
	
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
			parent.dismiss?(true)
		}
		
		func cropViewController(_ cropViewController: TOCropViewController,
								didCropTo image: UIImage,
								with cropRect: CGRect,
								angle: Int) {
			parent.meme.image = image
			parent.dismiss?(false)
		}
	}
}

struct ImageCropper_Previews: PreviewProvider {
	static var previews: some View {
		ImageCropper() { didCancel in
			print("Cancelled: \(didCancel)")
		}
			.environmentObject(Meme())
	}
	
	static func test(param: Bool) {
		print("Testing")
	}
}
