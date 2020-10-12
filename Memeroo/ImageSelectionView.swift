//
//  ImageSelectionView.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/9/20.
//

import SwiftUI

struct ImageSelectionView: View {
	
	@State private var inputImage: UIImage?
	@State private var captionText: String = ""
	
    var body: some View {
		VStack {
			MemeView(inputImage: $inputImage,
					 captionText: $captionText)
			
			Button(action: showShareSheet) {
				Text("Share meme")
			}
		}
		.padding(.horizontal)
	}
	
	func showShareSheet() {
		guard let image = inputImage else { return }
		let imageToSend = standInMemeView(image: image,
										  captionText: captionText).asImage()
		let av = UIActivityViewController(activityItems: [imageToSend],
										  applicationActivities: nil)
		let root = UIApplication.shared.windows.first?.rootViewController
		root?.present(av,
					  animated: true,
					  completion: nil)
	}
}

struct MemeView: View {
	@State private var image: Image? = nil
	@State private var showingImagePicker: Bool = false
	
	@Binding var inputImage: UIImage?
	@Binding var captionText: String
	
	var body: some View {
		VStack {
			TextField("Type caption here",
					  text: $captionText)
				.font(.system(size: 14))
				.frame(height: 50)
				.padding(.horizontal,
						 10)
				.border(Color.black,
						width: 2)
			
			ZStack {
				if image != nil {
					image?
						.resizable()
						.scaledToFit()
				} else {
					Rectangle()
						.fill(Color.secondary)
					
					Text("Tap to select a picture")
						.foregroundColor(.white)
						.font(.headline)
				}
			}
			.onTapGesture {
				print("Tapped")
				self.showingImagePicker = true
			}
		}
		.sheet(isPresented: $showingImagePicker, onDismiss: {
			loadImage()
		}) {
			ImagePicker(image: self.$inputImage)
		}
	}
	
	func loadImage() {
		guard let inputImage = inputImage else { return }
		image = Image(uiImage: inputImage)
	}
}

struct standInMemeView: View {
	@State var image: UIImage
	@State var captionText: String
	
	var body: some View {
		VStack {
			TextField("Type caption here",
					  text: $captionText)
				.font(.system(size: 14))
				.frame(height: 50)
				.padding(.horizontal,
						 10)
				.border(Color.black,
						width: 2)
			
			Image(uiImage: image)
				.resizable()
				.scaledToFit()
		}
	}
}

extension View {
	func asImage() -> UIImage {
		let controller = UIHostingController(rootView: self)

		// locate far out of screen
		controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
		UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)

		let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
		controller.view.bounds = CGRect(origin: .zero, size: size)
		controller.view.sizeToFit()

		let image = controller.view.asImage()
		controller.view.removeFromSuperview()
		return image
	}
}

extension UIView {
	func asImage() -> UIImage {
		let renderer = UIGraphicsImageRenderer(bounds: bounds)
		return renderer.image { rendererContext in
// [!!] Uncomment to clip resulting image
//             rendererContext.cgContext.addPath(
//                UIBezierPath(roundedRect: bounds, cornerRadius: 20).cgPath)
//            rendererContext.cgContext.clip()

// As commented by @MaxIsom below in some cases might be needed
// to make this asynchronously, so uncomment below DispatchQueue
// if you'd same met crash
//            DispatchQueue.main.async {
				 layer.render(in: rendererContext.cgContext)
//            }
		}
	}
}

struct ImagePicker: UIViewControllerRepresentable {
	@Environment(\.presentationMode) var presentationMode
	@Binding var image: UIImage?
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
		let picker = UIImagePickerController()
		picker.delegate = context.coordinator
		picker.allowsEditing = true
//		picker.mediaTypes = [(kUTTypeImage as String)] //this is default
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
			if let uiImage = info[.editedImage] as? UIImage {
				parent.image = uiImage
			}
			
			else if let uiImage = info[.originalImage] as? UIImage {
				parent.image = uiImage
			}
			
			parent.presentationMode.wrappedValue.dismiss()
		}
	}
}

struct ImageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSelectionView()
    }
}
