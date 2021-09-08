//
//  CalendarView.swift
//  CalSwiftUI
//
//  Created by Adam Kes on 11/13/19.
//  Copyright © 2019 KesDev. All rights reserved.
//

import SwiftUI
import SwiftUIPager

@available(OSX 10.15, *)
@available(iOS 14.0, *)
public struct CalendarView: View {

    let startDate: Date
    let monthsToDisplay: Int

    var selectableDates:[Date] =  [] //Ignored if self.dateRenderingDelegate is not nil!
	var dateRenderingDelegate: MonthCalDelegate? = nil

    var didSelectDayCompletion: ((Day)->Void)?
    
    var months: [Month] = []
    var colors: Colors
    @StateObject var page: Page = .first()
   // @//State var currentMonth: Month?


	// Delegate vesion
	public init(start: Date, monthsToShow: Int, dateRenderingDelegate: MonthCalDelegate? = nil, daySelectedCompletion: ((Day)->Void)?, colors: Colors = Colors()) {
		self.init(start: start, monthsToShow: monthsToShow, selectableDates: [], daySelectedCompletion: daySelectedCompletion, colors: colors)
		self.dateRenderingDelegate = dateRenderingDelegate
	}


    public init(start: Date, monthsToShow: Int, selectableDates: [Date] = [], daySelectedCompletion: ((Day)->Void)?, colors: Colors = Colors()) {
        self.startDate = start
        self.monthsToDisplay = monthsToShow
        self.selectableDates = selectableDates
        self.colors = colors
        self.didSelectDayCompletion = daySelectedCompletion
        
        self.generateMonths()
    }

    public var body: some View {
        ZStack(alignment: .topTrailing) {
			VStack {
            
				WeekdaysView(colors: self.colors)
				Divider()

				Pager(page: page, data: self.months, id: \.startDate) { month in
					MonthView(month: month, didSelectDayCompletion: self.didSelectDayCompletion)
				}
				.vertical().sensitivity(.high)
				.bounces(true)

				Spacer()
            }
            
            VStack(spacing: 15) {
                Button {
                    if self.page.index > 0 {
                     //   self.page.index = self.page.index - 1
                        self.page.update(.previous)
                    }
                } label: {
                    Image(systemName: "chevron.up")
                }.disabled(self.page.index <= 0)

                Button {
                    if self.page.index + 1 < self.months.count {
                        self.page.update(.next)
                      //  self.page.index = self.page.index + 1
                    }
                } label: {
                    Image(systemName: "chevron.down")
                }.disabled(self.page.index + 1 >= self.months.count)
            
            }.font(.system(size: 25)).padding(.top, 50).padding(.horizontal, 10)

           
		}.frame(minWidth: 420, idealWidth: 500, minHeight: 580, idealHeight: 580, maxHeight: 600)

    }
    
    mutating func generateMonths() {
		let firstMonth = Month(startDate: self.earliestDate, delegate: self.dateRenderingDelegate, selectableDates: selectableDates, colors: self.colors)
        self.months.append(firstMonth)
        
        if monthsCount > 1 {
            for  i in 1..<self.monthsCount {
             // print("generating months...")
                let month =  Month(startDate: self.nextMonth(currentMonth: self.earliestDate, add: i), delegate: self.dateRenderingDelegate, selectableDates: selectableDates, colors: self.colors)
                self.months.append(month)
            }

        }
        self.months.reverse()
        
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

@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
		let testDelegate = MonthCalTestDelegate(approxNumberOfRandomDates: 120, maxNumDaysBack: 60, fromStartDate: Date().startOfDay())

		CalendarView(start: Date(), monthsToShow: 2, dateRenderingDelegate: testDelegate, daySelectedCompletion: { aDay in
			print("day \(aDay.dayDate) selected!")
		}, colors: Colors())




    }
}
