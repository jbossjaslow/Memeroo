//
//  ImagePicker.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/15/20.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
	let dismissFuncShouldShowCropper: (Bool) -> Void
	@Binding var image: UIImage?
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
		let picker = UIImagePickerController()
		picker.delegate = context.coordinator
		return picker
	}
	
	func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}
	
	class Coordinator: NSObject,
					   UINavigationControllerDelegate,
					   UIImagePickerControllerDelegate {
		let parent: ImagePicker
		
		init(_ parent: ImagePicker) {
			self.parent = parent
		}
		
		func imagePickerController(_ picker: UIImagePickerController,
								   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
			if let uiImage = info[.originalImage] as? UIImage {
				parent.image = uiImage
				parent.dismissFuncShouldShowCropper(true)
			} else {
				parent.dismissFuncShouldShowCropper(false)
			}
		}
		
		func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
			parent.dismissFuncShouldShowCropper(false)
		}
	}
}

struct ImagePicker_Previews: PreviewProvider {
	@State static var image: UIImage?
	static var previews: some View {
		ImagePicker(dismissFuncShouldShowCropper: test(param:),
					image: $image)
	}
	
	static func test(param: Bool) {
		print("Testing")
	}
}
