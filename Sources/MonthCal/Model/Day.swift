//
//  Day.swift
//  CalSwiftUI
//
//  Created by Adam Kes on 11/12/19.
//  Copyright © 2019 KesDev. All rights reserved.
//

import Foundation
import SwiftUI

@available(OSX 10.15, *)
@available(iOS 13.0, *)
public struct Day: Identifiable {

//    @Published var isSelected = false
    public var id = UUID()

	var propertyIndicators: [DayPropertyIndicatorViewModel]
    var selectable: Bool
    public var dayDate: Date
    var placeholder: Bool
    var colors: Colors
    var dayName: String {
        self.placeholder ?  "" : dayDate.dateToString(format: "d")
    }
    var isToday = false
    var disabled = false

    var textColor: Color {
        if isToday {
            return colors.todayTextColor
        }
        if selectable {
            return colors.selectedTextColor
        } else {
            return colors.disabledTextColor
        }

    }
    var backgroundColor: Color {
        if selectable {
            return colors.selectedBackgroundColor
        } else {
            return colors.backgroundColor
        }
    }

	public init(date: Date, today: Bool = false, selectable: Bool, placeholder: Bool = false, propertyIndicators: [DayPropertyIndicatorViewModel] = [], colors: Colors) {
        dayDate = date
        isToday = today
        self.selectable = selectable
        self.placeholder = placeholder
        self.colors = colors
		self.propertyIndicators = propertyIndicators
    }

}
