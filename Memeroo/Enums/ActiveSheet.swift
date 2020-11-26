//
//  ActiveSheet.swift
//  Memeroo
//
//  Created by Josh Jaslow on 11/26/20.
//

import Foundation

enum ActiveSheet: Identifiable {
	case picker, cropper
	
	var id: Int {
		hashValue
	}
}
