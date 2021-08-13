//
//  CellView.swift
//  CalSwiftUI
//
//  Created by Adam Kes on 11/13/19.
//  Copyright © 2019 KesDev. All rights reserved.
//

import SwiftUI


@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct DayCellView: View {

    var day: Day
    var selectionCompletion: ((Day)->Void)?
	var propertyIndicators: [DayPropertyIndicatorViewModel] = []

    var body: some View {
		ZStack {
			Group {
				Text(day.dayName)
					.aspectRatio(1.0, contentMode: .fit)
					.frame(width: 64, height: 64)
					.foregroundColor(day.textColor)
					.background(day.backgroundColor)
					.border(SeparatorShapeStyle(), width: 3.0)
					.shadow(radius: 3)
					.clipShape(RoundedRectangle(cornerRadius: 2))
					.clipped()

					.onTapGesture {
						if self.day.selectable {
							self.selectionCompletion?(self.day)
						//    self.day.isSelected.toggle()
						}
				}
			}
//			.overlay(alignment: Alignment.topTrailing) {
				Group {
					ForEach(propertyIndicators) { anIndicator in
						DayPropertyIndicatorView(modelView: anIndicator)
					}// end ForEach
				} // end group
				.offset(x: 20, y: 20) // bottomRight corner
//			}



		} // end ZStack
    }
}

@available(OSX 10.15, *)
@available(iOS 13.0, *)
struct CellView_Previews: PreviewProvider {
    static var previews: some View {
		let defaultColors = Colors()
		let testDay = Day(date: Date(), selectable: true, colors: defaultColors)
        DayCellView(day: testDay)

		DayCellView(day: testDay, propertyIndicators: [DayPropertyIndicatorViewModel(fillColor: .gray, systemBaseImageName: "pin") ])
    }
}
