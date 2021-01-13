//
//  CalendarView.swift
//  CalSwiftUI
//
//  Created by Adam Kes on 11/13/19.
//  Copyright © 2019 KesDev. All rights reserved.
//

import SwiftUI

@available(OSX 10.15, *)
@available(iOS 13.0, *)
public struct CalendarView: View {

    let startDate: Date
    let monthsToDisplay: Int
    var selectableDates:[Date]
    var didSelectDayCompletion: ((Day)->Void)?

    public init(start: Date, monthsToShow: Int, selectableDates: [Date] = [], daySelectedCompletion: ((Day)->Void)?) {
        self.startDate = start
        self.monthsToDisplay = monthsToShow
        self.selectableDates = selectableDates
        self.didSelectDayCompletion = daySelectedCompletion
        
    }

    public var body: some View {
        VStack {
            WeekdaysView()
            ScrollView {
                MonthView(month: Month(startDate: self.earliestDate, selectableDates: selectableDates), didSelectDayCompletion: self.didSelectDayCompletion)
                if monthsToDisplay > 1 {
                    ForEach(1..<self.monthsCount) {
                        MonthView(month: Month(startDate: self.nextMonth(currentMonth: self.earliestDate, add: $0), selectableDates: self.selectableDates), didSelectDayCompletion: self.didSelectDayCompletion)
                    }
                }
            }
        }
    }
    
    var monthsCount: Int {
        if self.selectableDates.isEmpty {return self.monthsToDisplay}
        
        let orderedDates = self.selectableDates.sorted(by: {$0 < $1})
  
        if Calendar.current.isDate(orderedDates.first!, inSameMonthAs: orderedDates.last!) {
            return 1
        }
//        let components0 = Calendar.current.dateComponents([.month], from: orderedDates.first!)
//        let components1 = Calendar.current.dateComponents([.month], from: orderedDates.last!)
//
        var monthsBetween = Date.monthsBetweenTwoDates(firstDate: orderedDates.first!, secondDate: orderedDates.last!) ?? 0
        print("months between: \(monthsBetween)")
    //    let adjusted =  monthsBetween  + 1
        if monthsBetween == 0 {
            monthsBetween = 1
        }
        return monthsBetween + 1
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
