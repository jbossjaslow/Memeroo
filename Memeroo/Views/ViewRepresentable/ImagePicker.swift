//
//  ImagePicker.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/15/20.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
	@EnvironmentObject var meme: Meme
	let dismissFuncShouldShowCropper: (Bool) -> Void
	
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
				parent.meme.image = uiImage
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
	static var previews: some View {
		ImagePicker(dismissFuncShouldShowCropper: test(param:))
			.environmentObject(Meme())
	}
	
	static func test(param: Bool) {
		print("Testing")
	}
}
