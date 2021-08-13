//
//  File.swift
//  File
//
//  Created by Pho Hale on 8/12/21.
//

import Foundation


////////////////////////////////////////////////////////////////////
//MARK: -
//MARK: - TODO: Note this is note very SwiftUI at all

public protocol MonthCalDelegate {

//	func monthCal(calendarView: CalendarView, isSelectableForDate: Date) -> Bool // returns true if the date can be selected, otherwise returns false
//	func monthCal(calendarView: CalendarView, propertyIndicatorsForDate: Date) -> [DayPropertyIndicatorViewModel] // returns an array of the property indicators to display on a given day cell


	func monthCal(isSelectableForDate: Date) -> Bool // returns true if the date can be selected, otherwise returns false
	func monthCal(propertyIndicatorsForDate: Date) -> [DayPropertyIndicatorViewModel] // returns an array of the property indicators to display on a given day cell



//	func onDateSelected(aDay: Day)

}



public struct MonthCalTestDelegate: MonthCalDelegate {

	var numberOfRandomDates: Int = 15

	let calendar = Calendar.current

	var testDates: [Date] = []
//	lazy var testDates: [Date] = {
//		let today = Date().startOfDay()
//		return Date.generateTestDates(maxDaysBack: 60, fromDate: today, numSamples: self.numberOfRandomDates)
//	}()

//	var testIsSelectable: [Date:Bool] = [:]

	var testIsSelectable: [Date:Bool] = [:]

//	lazy var testIsSelectable: [Bool] = {
//		return Array(0..<numberOfRandomDates).map({ _ in Bool.random() })
//	}()

	var testIndicators: [Date:[DayPropertyIndicatorViewModel]] = [:]

//   lazy var testIndicators: [[DayPropertyIndicatorViewModel]] = {
//		let flagIndicator = DayPropertyIndicatorViewModel(fillColor: .red, systemBaseImageName: "flag")
//		let pinIndicator = DayPropertyIndicatorViewModel(fillColor: .yellow, systemBaseImageName: "pin")
//		let blueCircleIndicator = DayPropertyIndicatorViewModel(fillColor: .blue, systemBaseImageName: "circle")
//		let allOptions = [flagIndicator, pinIndicator, blueCircleIndicator]
//	   return Array(0..<numberOfRandomDates).map({ _ in
//		   return [allOptions.randomElement()!]
//	   })
//   }()

	public func monthCal(isSelectableForDate testDate: Date) -> Bool {
//		guard let validFoundDateIndex = self.testDates.firstIndex(of: testDate) else { return true; }
//		return self.testIsSelectable[validFoundDateIndex]
		let testDayDate = testDate.startOfDay()
		return self.testIsSelectable[testDayDate] ?? true
	}

	public func monthCal(propertyIndicatorsForDate testDate: Date) -> [DayPropertyIndicatorViewModel] {
//		guard let validFoundDateIndex = self.testDates.firstIndex(of: testDate) else { return []; }
//		return self.testIndicators[validFoundDateIndex]
		let testDayDate = testDate.startOfDay()
		return self.testIndicators[testDate] ?? []
	}

	public init(approxNumberOfRandomDates numberOfRandomDates: Int = 8, maxNumDaysBack: Int = 10, fromStartDate startDate: Date = Date()) {
		self.numberOfRandomDates = numberOfRandomDates
		self.testDates = Date.generateTestDates(maxDaysBack: maxNumDaysBack, fromDate: startDate, numSamples: self.numberOfRandomDates)

		let flagIndicator = DayPropertyIndicatorViewModel(fillColor: .red, systemBaseImageName: "flag")
		let pinIndicator = DayPropertyIndicatorViewModel(fillColor: .yellow, systemBaseImageName: "pin")
		let blueCircleIndicator = DayPropertyIndicatorViewModel(fillColor: .blue, systemBaseImageName: "circle")
		let allOptions = [flagIndicator, pinIndicator, blueCircleIndicator]

		for aDate in self.testDates {
			self.testIsSelectable[aDate] = Bool.random()
			self.testIndicators[aDate] = [allOptions.randomElement()!]
		}
	}

}


