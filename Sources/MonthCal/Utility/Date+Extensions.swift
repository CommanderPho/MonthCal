//
//  File.swift
//  File
//
//  Created by Pho Hale on 8/13/21.
//

import Foundation

extension Date {

	func startOfDay() -> Date {
		return Calendar.current.startOfDay(for: self)
	}

	// Testing Only:

	// Generates random dates a maximimum of maxDaysBack from the specified date. Returns numSamples samples (allowing repeats)
	static func generateTestDates(maxDaysBack: Int, fromDate testDate: Date = Date().startOfDay(), numSamples: Int) -> [Date] {
		var outDates: [Date] = []
		for randomDateIndex in 0..<numSamples {
			let currRandomDaysOffset = -1 * Int.random(in: 0...maxDaysBack) // up to 60 days ago
			guard let currTestDate = Calendar.current.date(byAdding: .day, value: currRandomDaysOffset, to: testDate) else {
				fatalError("Error generating date!")
			}
			outDates.append(currTestDate)
		}
		return outDates
	}


}
