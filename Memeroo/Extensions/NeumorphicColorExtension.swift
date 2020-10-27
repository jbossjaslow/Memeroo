//
//  NeumorphicColorExtension.swift
//  Memeroo
//
//  Created by Josh Jaslow on 10/27/20.
//

import SwiftUI

extension Color {
	static let offWhite = Color(red: 	225 / 255,
								green: 	225 / 255,
								blue: 	235 / 255)
	static let myPink = Color(red: 225/255, green: 137/255, blue: 178/255)
	static let specialBlack = Color.black.opacity(0.2)
	static let darkPink = Color(red: 112.5/255, green: 68.5/255, blue: 89/255)
	
	var red: Double {
		let components = UIColor(self).rgba
		return Double(components.red)
	}
	
	var green: Double {
		let components = UIColor(self).rgba
		return Double(components.green)
	}
	
	var blue: Double {
		let components = UIColor(self).rgba
		return Double(components.blue)
	}
	
	var alpha: Double {
		let components = UIColor(self).rgba
		return Double(components.alpha)
	}
	
	var offLight: Color {
		return offLight(red: red,
						green: green,
						blue: blue,
						alpha: alpha)
	}
	
	var offDark: Color {
		return offDark(red: red,
					   green: green,
					   blue: blue,
					   alpha: alpha)
	}
	
	/// Gives a slightly brighter version of the color passed in
	/// - Parameters:
	///   - red: Red value
	///   - green: Green value
	///   - blue: Blue value
	///   - alpha: Alpha value
	/// - Returns: `Color` Slightly lighter color
	func offLight(red: Double, green: Double, blue: Double, alpha: Double = 1) -> Color {
		guard Double.average(nums: red, green, blue) < (255 / 1.1) else {
			return .white
		}
		let lighteningAmount = 1.15
		return Color(red: red * lighteningAmount,
					 green: green * lighteningAmount,
					 blue: blue * lighteningAmount,
					 opacity: alpha)
	}
	
	/// Gives a slightly darker version of the color passed in
	/// - Parameters:
	///   - red: Red value
	///   - green: Green value
	///   - blue: Blue value
	///   - alpha: Alpha value
	/// - Returns: `Color` Slightly darker color
	func offDark(red: Double, green: Double, blue: Double, alpha: Double = 1) -> Color {
		guard Double.average(nums: red, green, blue) > (10/255) else {
			return .black
		}
		let darkeningAmount = 0.85
		return Color(red: red * darkeningAmount,
					 green: green * darkeningAmount,
					 blue: blue * darkeningAmount,
					 opacity: alpha)
	}
}
