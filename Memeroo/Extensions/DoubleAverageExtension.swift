//
//  DoubleAverageExtension.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/27/20.
//

extension Double {
	static func average(nums: Double...) -> Double {
		let total = nums.reduce(0, +)
		return total / Double(nums.count)
	}
}
