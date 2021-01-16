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
    var selectable: Bool
    public var dayDate: Date
    var placeholder: Bool
    var dayName: String {
        self.placeholder ?  "" : dayDate.dateToString(format: "d")
    }
    var isToday = false
    //var disabled = false
    let colors = Colors()
    var textColor: Color {
        if isToday {
            return colors.todayColor
        }
        if selectable {
            return colors.selectedColor
        } else {
            return colors.disabledColor
        }

    }
    var backgroundColor: Color {
        if selectable {
            return colors.selectedBackgroundColor
        } else {
            return colors.backgroundColor
        }
    }

    public init(date: Date, today: Bool = false, selectable: Bool, placeholder: Bool = false) {
        dayDate = date
        isToday = today
        self.selectable = selectable
        self.placeholder = placeholder
    }

}
