//
//  ForEachExtention.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/24/20.
//

import SwiftUI

extension ForEach where Data.Element: Hashable, ID == Data.Element, Content: View {
	init(values: Data, content: @escaping (Data.Element) -> Content) {
		self.init(values, id: \.self, content: content)
	}
}
