//
//  ImagePickerWithNav.swift
//  Memeroo
//
//  Created by Josh Jaslow on 12/13/20.
//

import SwiftUI
import TOCropViewController

struct ImagePickerWithNav: UIViewControllerRepresentable {
	@EnvironmentObject var meme: Meme
	let dismissFuncShouldShowCropper: (Bool) -> Void
	@State var navController: UINavigationController?
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerWithNav>) -> UINavigationController {
		let picker = UIImagePickerController()
		picker.delegate = context.coordinator
		navController = UINavigationController(rootViewController: picker)
		return navController ?? UINavigationController()
	}
	
	func updateUIViewController(_ uiViewController: UINavigationController,
								context: UIViewControllerRepresentableContext<ImagePickerWithNav>) {}
	
	class Coordinator: NSObject,
					   UINavigationControllerDelegate,
					   UIImagePickerControllerDelegate,
					   TOCropViewControllerDelegate {
		let parent: ImagePickerWithNav
		
		init(_ parent: ImagePickerWithNav) {
			self.parent = parent
		}
		
		func imagePickerController(_ picker: UIImagePickerController,
								   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
			if let uiImage = info[.originalImage] as? UIImage {
				let vc = TOCropViewController(image: uiImage)
				vc.delegate = self
				parent.navController?.pushViewController(vc, animated: true)
			} else {
				parent.dismissFuncShouldShowCropper(false)
			}
		}
		
		func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
			parent.dismissFuncShouldShowCropper(false)
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
