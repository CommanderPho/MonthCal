import XCTest
@testable import MonthCal

final class MonthCalTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.

    }
    
    func testMonthsBetween() {
        let today = Date()
        let firstDate =  today.add(units: -1, component: Calendar.Component.month)
        let secondDate = today.add(units: 1, component: Calendar.Component.month)
 
        XCTAssertEqual(Date.monthsBetweenTwoDates(firstDate: firstDate, secondDate: secondDate), 2)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
