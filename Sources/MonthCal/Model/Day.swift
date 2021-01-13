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
public class Day:ObservableObject {

//    @Published var isSelected = false

    @Published var selectable: Bool
    public var dayDate: Date
    var dayName: String {
        dayDate.dateToString(format: "d")
    }
    var isToday = false
    //var disabled = false
    let colors = Colors()
    var textColor: Color {
        if selectable {
            return colors.selectedColor
        } else {
            return colors.disabledColor
        }
        
//        if isToday {
//            return colors.todayColor
//        }
        return colors.textColor
    }
    var backgroundColor: Color {
        if selectable {
            return colors.selectedBackgroundColor
        } else {
            return colors.backgroundColor
        }
    }

   public init(date: Date, today: Bool = false, selectable: Bool) {
        dayDate = date
        isToday = today
        self.selectable = selectable
    }

}
