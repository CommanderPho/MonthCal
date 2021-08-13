//
//  MonthView.swift
//  CalSwiftUI
//
//  Created by Adam Kes on 11/12/19.
//  Copyright © 2019 KesDev. All rights reserved.
//

import SwiftUI

@available(OSX 10.15, *)
@available(iOS 14.0, *)
struct MonthView: View {

    var month: Month
    var didSelectDayCompletion: ((Day)->Void)?
    let  columns = Array.init(repeating: GridItem(.flexible()), count: Calendar.current.weekdaySymbols.count)
    
    var body: some View {
      
        VStack(alignment: .center) {
			Text("\(month.monthNameYear)")
				.font(.headline)
				.padding()
      
            LazyVGrid(columns: columns) {
                ForEach(self.month.monthDays, id:\.id) {day in
                    DayCellView(day: day, selectionCompletion: self.didSelectDayCompletion)
                        .padding(.top, 5).padding(.bottom, 5)
                }

            }

        }
        .padding(.bottom, 20)

    }
}


@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
		let defaultColors = Colors()
		let aMonth = Month(startDate: Date(), colors: defaultColors)
        MonthView(month: aMonth)
    }
}
