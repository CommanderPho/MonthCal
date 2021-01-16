//
//  Weekdays.swift
//  CalSwiftUI
//
//  Created by Adam Kes on 11/13/19.
//  Copyright © 2019 KesDev. All rights reserved.
//

import SwiftUI

@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct WeekdaysView: View {
    let weekdays = ["S", "M", "T", "W", "T", "F", "S"]
    let colors = Colors()

    var body: some View {
        HStack {
            ForEach(Calendar.current.shortWeekdaySymbols, id: \.self) { weekday in
                
                Spacer()
                Text(String(weekday.first!)).bold()
                Spacer()
            }
        
        }.padding(.bottom, 20).background(colors.weekdayBackgroundColor)
    }
}

@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct WeekdaysView_Previews: PreviewProvider {
    static var previews: some View {
        WeekdaysView()
    }
}
