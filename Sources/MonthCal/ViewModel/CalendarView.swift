//
//  CalendarView.swift
//  CalSwiftUI
//
//  Created by Adam Kes on 11/13/19.
//  Copyright © 2019 KesDev. All rights reserved.
//

import SwiftUI

@available(OSX 10.15, *)
@available(iOS 14.0, *)
public struct CalendarView: View {

    let startDate: Date
    let monthsToDisplay: Int
    var selectableDates:[Date] =  []
    var didSelectDayCompletion: ((Day)->Void)?
    
    var months: [Month] = []
    var colors: Colors
    
    public init(start: Date, monthsToShow: Int, selectableDates: [Date] = [], daySelectedCompletion: ((Day)->Void)?, colors: Colors = Colors()) {
        self.startDate = start
        self.monthsToDisplay = monthsToShow
        self.selectableDates = selectableDates
        self.colors = colors
        self.didSelectDayCompletion = daySelectedCompletion
        
        self.generateMonths()
    }

    public var body: some View {
        VStack {
            WeekdaysView(colors: self.colors)
            Divider()
            ScrollView {
                LazyVStack {
                    ForEach(self.months, id: \.startDate) { month in
                        VStack {
                            MonthView(month: month, didSelectDayCompletion: self.didSelectDayCompletion)
                            Divider()
                        }
                    }
                }

            }
        }

    }
    
    mutating func generateMonths() {
        let firstMonth = Month(startDate: self.earliestDate, selectableDates: selectableDates, colors: self.colors)
        self.months.append(firstMonth)
        
        if monthsCount > 1 {
            for  i in 1..<self.monthsCount {
             // print("generating months...")
                let month =  Month(startDate: self.nextMonth(currentMonth: self.earliestDate, add: i), selectableDates: selectableDates, colors: self.colors)
                self.months.append(month)
            }

        }
        
    }
    

    
    var monthsCount: Int {
        if self.selectableDates.isEmpty {return self.monthsToDisplay}
        
        let orderedDates = self.selectableDates.sorted(by: {$0 < $1})
  
        if Calendar.current.isDate(orderedDates.first!, inSameMonthAs: orderedDates.last!) { // case if
            return 1
        }

        var monthsToCover = Date.monthsToCover(firstDate: orderedDates.first!, secondDate: orderedDates.last!)

        if monthsToCover == 0 {
            monthsToCover = 1
        }
     //   print("month count: \(monthsToCover + 1)")
        return monthsToCover + 1
    }
    
    var earliestDate: Date {
        self.selectableDates.min() ?? self.startDate
    }
    

    func nextMonth(currentMonth: Date, add: Int) -> Date {
        var components = DateComponents()
        components.month = add
        let next = Calendar.current.date(byAdding: components, to: currentMonth)!
        return next
    }


}

//@available(OSX 10.15, *)
//@available(iOS 13.0, *)
//struct CalendarView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarView(start: Date(), monthsToShow: 2)
//    }
//}
