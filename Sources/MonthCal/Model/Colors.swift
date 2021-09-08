//
//  Colors.swift
//  CalSwiftUI
//
//  Created by Adam Kes on 11/13/19.
//  Copyright © 2019 KesDev. All rights reserved.
//

import Foundation
import SwiftUI


public struct Colors {

    public var textColor: Color
    public var todayTextColor: Color
    public var disabledTextColor: Color
    public var selectedTextColor: Color

    //Background
    public var backgroundColor: Color
    public var weekdayBackgroundColor: Color
    public var selectedBackgroundColor: Color


	public init(textColor: Color = .primary, todayTextColor: Color = .blue, disabledTextColor: Color = Color.gray, selectedTextColor:Color = Color.primary, backgroundColor:Color =  Color.clear, weekdayBackgroundColor: Color =  Color.clear, selectedBackgroundColor: Color = .orange) {
		self.textColor = textColor
		self.todayTextColor = todayTextColor
		self.disabledTextColor = disabledTextColor
		self.selectedTextColor = selectedTextColor
		self.backgroundColor = backgroundColor
		self.weekdayBackgroundColor = weekdayBackgroundColor
		self.selectedBackgroundColor = selectedBackgroundColor
	}
}
