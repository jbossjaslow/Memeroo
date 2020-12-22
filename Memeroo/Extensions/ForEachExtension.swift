//
//  ForEachExtention.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/24/20.
//

import SwiftUI

extension ForEach where Data.Element: Hashable, ID == Data.Element, Content: View {
	/// ForEach constructor specifically for String arrays
	/// - Parameters:
	///   - values: Data to create views from
	///   - content: Views to create
	init(values: Data, content: @escaping (Data.Element) -> Content) {
		self.init(values, id: \.self, content: content)
	}
}

/**
A ForEach view that throws out the index in addition to the current item

Usage

	ForEachWithIndex(self.quizVM.entries, id: \.self) { index, item in
		QuizWordView(entry: item,
			correctFunc: self.quizVM.checkCorrect,
			flipped: self.$quizVM.flipped[index])
	}
*/
struct ForEachWithIndex<Data: RandomAccessCollection, ID: Hashable, Content: View>: View {
	var data: Data
	var id: KeyPath<Data.Element, ID>
	var content: (_ index: Data.Index, _ element: Data.Element) -> Content

	public init(_ data: Data, id: KeyPath<Data.Element, ID>, content: @escaping (_ index: Data.Index, _ element: Data.Element) -> Content) {
		self.data = data
		self.id = id
		self.content = content
	}

	public var body: some View {
		ForEach(
			zip(self.data.indices, self.data).map { index, element in
				IndexInfo(
					index: index,
					id: self.id,
					element: element
				)
			},
			id: \.elementID
		) { indexInfo in
			self.content(indexInfo.index, indexInfo.element)
		}
	}
}

extension ForEachWithIndex where ID == Data.Element.ID, Content: View, Data.Element: Identifiable {
	init(_ data: Data, @ViewBuilder content: @escaping (_ index: Data.Index, _ element: Data.Element) -> Content) {
		self.init(data, id: \.id, content: content)
	}
}

fileprivate struct IndexInfo<Index, Element, ID: Hashable>: Hashable {
	let index: Index
	let id: KeyPath<Element, ID>
	let element: Element

	var elementID: ID {
		self.element[keyPath: self.id]
	}

	static func == (_ lhs: IndexInfo, _ rhs: IndexInfo) -> Bool {
		lhs.elementID == rhs.elementID
	}

	func hash(into hasher: inout Hasher) {
		self.elementID.hash(into: &hasher)
	}
}
