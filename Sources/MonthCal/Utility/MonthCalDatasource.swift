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

public protocol MonthCalDelegate: AnyObject {

	func monthCal(isSelectableForDate: Date) -> Bool // returns true if the date can be selected, otherwise returns false
	func monthCal(propertyIndicatorsForDate: Date) -> [DayPropertyIndicatorViewModel] // returns an array of the property indicators to display on a given day cell

//	func onDateSelected(aDay: Day)

}



class MonthCalTestDelegate: MonthCalDelegate {

	func monthCal(isSelectableForDate: Date) -> Bool {
//		switch isSelectableForDate {
//		case <#pattern#>:
//			<#code#>
//		default:
//			<#code#>
//		}
	}

	func monthCal(propertyIndicatorsForDate: Date) -> [DayPropertyIndicatorViewModel] {
		// Set some arbitrary days
		let today = Date()
//		today.add(units: -2, component: .day)
//
//		let propertyDates =


	}


}


