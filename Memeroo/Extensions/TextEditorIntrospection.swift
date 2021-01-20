//
//  TextEditorIntrospection.swift
//  Memeroo
//
//  Created by Josh Jaslow on 1/18/21.
//

import SwiftUI
import Introspect

extension View {
	private func introspectTextEditor(customize: @escaping (UITextView) -> ()) -> some View {
		return inject(UIKitIntrospectionView(
			selector: { introspectionView in
				guard let viewHost = Introspect.findViewHost(from: introspectionView) else {
					return nil
				}
				return Introspect.previousSibling(containing: UITextView.self, from: viewHost)
			},
			customize: customize
		))
	}
	
	func addDoneButtonForTextEditor() -> some View {
		self.introspectTextEditor { (textView) in
			let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textView.frame.size.width, height: 44))
			let flexButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
											 target: nil,
											 action: nil)
			let doneButton = UIBarButtonItem(title: "Done",
											 style: .done,
											 target: self,
											 action: #selector(textView.doneButtonTapped(button:)))
			doneButton.tintColor = UIColor(Color.myPink)
			toolBar.items = [flexButton, doneButton]
			toolBar.setItems([flexButton, doneButton],
							 animated: true)
			textView.inputAccessoryView = toolBar
		}
	}
}

extension UITextView {
   @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
	  self.resignFirstResponder()
   }
}
