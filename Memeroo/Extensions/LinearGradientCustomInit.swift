//
//  LinearGradient.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/27/20.
//

import SwiftUI

extension LinearGradient {
	init(_ colors: Color...) {
		self.init(gradient: Gradient(colors: colors),
				  startPoint: .topLeading,
				  endPoint: .bottomTrailing)
	}
}
