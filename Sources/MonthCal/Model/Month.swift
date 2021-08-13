//
//  Month.swift
//  CalSwiftUI
//
//  Created by Adam Kes on 11/12/19.
//  Copyright © 2019 KesDev. All rights reserved.
//

import Foundation
import SwiftUI

@available(OSX 10.15, *)
@available(iOS 13.0, *)


struct Month: Equatable {
    
    static func == (lhs: Month, rhs: Month) -> Bool {
        lhs.startDate == rhs.startDate
    }
    
    private let calendar = Calendar.current

    var startDate: Date

	var delegate: MonthCalDelegate? = nil // Alternative to hardcoded selectableDates and propertyIndicatorsMapping

	// Note: These variables are ignored if self.delegate is true!
    var selectableDates: [Date] = []
	var propertyIndicatorsMapping: [Date:[DayPropertyIndicatorViewModel]] = [:] //TODO: make a datasource-like property that returns the appropriate indicators given the date


    var colors: Colors
    var today = Date()
    var monthNameYear: String {
        self.monthHeader()
    }
    var monthDays: [Day] {
        return self.dayArray()
    }


    private func monthHeader() -> String {
        let components = calendar.dateComponents([.year, .month], from: startDate)
        let currentMonth = calendar.date(from: components)!
        return currentMonth.dateToString(format: "LLLL yyyy")
    }

    private func dateToString(date: Date, format: String) -> String {
        let dateFormat = DateFormatter.init()
        dateFormat.dateFormat = format
        let dateString = dateFormat.string(from: date)
        return dateString
    }

    private func firstOfMonth() -> Date {
        let components = calendar.dateComponents([.year, .month], from: startDate)
        let firstOfMonth = calendar.date(from: components)!
        return firstOfMonth
    }

    private func lastOfMonth() -> Date {
        var components = DateComponents()
        components.month = 1
        components.day = -1
        let lastOfMonth = calendar.date(byAdding: components, to: firstOfMonth())!
        return lastOfMonth
    }

    private func dateToWeekday(date: Date) -> Int {
        let components = calendar.dateComponents([.weekday], from: date)
        guard let weekday = components.weekday else {
            fatalError("Cannot convert weekday to Int")
        }
        return weekday
    }

    private func dayArray()->[Day] {
        var arrayOfDays: [Day] = []
        let fom = firstOfMonth()
        let lom = lastOfMonth()
        var currentDate = fom
        var weekdayColumn = 0
        
        let currentCalendarWeekdayCount = Calendar.current.weekdaySymbols.count
        
        while (fom <= currentDate && currentDate <= lom) {
          //  print("day creation while loop current date \(currentDate.description)")
            weekdayColumn += 1
            if weekdayColumn > currentCalendarWeekdayCount {
                weekdayColumn = 1
            }
            let currentDateWeekday = dateToWeekday(date: currentDate)
            
            while currentDateWeekday > weekdayColumn {
                arrayOfDays.append(Day(date: Date(), selectable: false, placeholder: true, colors: self.colors))
               weekdayColumn += 1
            }

            let currentDateInt = Int(currentDate.dateToString(format: "MMdyy"))!
            let todayDateInt = Int(today.dateToString(format: "MMdyy"))!
            let isToday = currentDateInt == todayDateInt ? true : false

			let selectable: Bool!
			let propertyIndicators: [DayPropertyIndicatorViewModel]!

			if let validDelegate = self.delegate {
				// Set the day's properties from the delegate
				selectable = validDelegate.monthCal(isSelectableForDate: currentDate)
				propertyIndicators = validDelegate.monthCal(propertyIndicatorsForDate: currentDate)
			}
			else {
				// Otherwise set them from the hard-coded variables
				selectable = currentDate.hasMatchingDayIn(dates: self.selectableDates)
				propertyIndicators = propertyIndicatorsMapping[currentDate] ?? []
			}


            let currentDay = Day(date: currentDate, today: isToday, selectable: selectable, propertyIndicators: propertyIndicators, colors: self.colors)
            arrayOfDays.append(currentDay)


            //Increment date
            var components = calendar.dateComponents([.day], from: currentDate)
            components.day = +1
            currentDate = calendar.date(byAdding: components, to: currentDate)!
        }
        
        return arrayOfDays
    }




}
