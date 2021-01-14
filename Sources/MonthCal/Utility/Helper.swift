//
//  Helper.swift
//  CalSwiftUI
//
//  Created by Adam Kes on 11/12/19.
//  Copyright © 2019 KesDev. All rights reserved.
//

import Foundation
import SwiftUI

extension Date {

    func dateToString(format: String) -> String {
        let dateFormat = DateFormatter.init()
        dateFormat.dateFormat = format
        let dateString = dateFormat.string(from: self)
        return dateString
    }
    
    func hasMatchingDayIn(dates: [Date])->Bool {
        guard dates.isEmpty == false else {return false}
        
        for date in dates {
            if Calendar.current.isDate(self, inSameDayDateAs: date) == true {
                return true
            }
        }
        
        return false
    }
    
    static func monthsBetweenTwoDates(firstDate:Date, secondDate:Date) -> Int? {
          
          let currentCalendar = Calendar.current
          let monthUnit = Calendar.Component.month
          
          let monthsBetween = currentCalendar.dateComponents([monthUnit], from: firstDate, to: secondDate)
          
          return monthsBetween.month
      }
    
    func add(units: Int, component: Calendar.Component)->Date {
      
        var components = DateComponents()
        components.setValue(units, for: component)
        
        var calendar = Calendar.current
        calendar.timeZone =  TimeZone.current

        let incrementedDate = calendar.date(byAdding: components, to: self)!

        return incrementedDate

    }
    

}


extension String {

    func stringToDate(format: String) -> Date {
        let dateFormat = DateFormatter.init()
        dateFormat.dateFormat = format
        let date = dateFormat.date(from: self)!
        return date
    }

}

extension Calendar {
    func isDate(_ date: Date, inSameDayDateAs: Date)->Bool {
        
         let componentsDate0 = self.dateComponents(in: TimeZone.current, from: date)
        let day0 = componentsDate0.day
        let month0 = componentsDate0.month
        let year0 = componentsDate0.year

        let componentsDate1 = self.dateComponents(in: TimeZone.current, from: inSameDayDateAs)
        let day1 = componentsDate1.day
        let month1 = componentsDate1.month
        let year1 = componentsDate1.year
        
        return day0 == day1 && month0 == month1 && year0 == year1

    }
    
    func isDate(_ date: Date, inSameMonthAs: Date)->Bool {
        
         let componentsDate0 = self.dateComponents(in: TimeZone.current, from: date)
        let monthDate0 = componentsDate0.month

        let componentsDate1 = self.dateComponents(in: TimeZone.current, from: inSameMonthAs)
        let monthDate1 = componentsDate1.month
        
        return monthDate0 == monthDate1

    }
    
    
}

extension View {
    func applyIf<T: View>(_ condition: @autoclosure () -> Bool, apply: (Self) -> T) -> AnyView {
        if condition() {
            return apply(self).eraseToAnyView()
        } else { 
            return self.eraseToAnyView()
        }
    }
    func eraseToAnyView()->AnyView {
        return AnyView(self)
    }
}
