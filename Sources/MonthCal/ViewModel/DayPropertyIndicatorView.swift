//
//  SwiftUIView.swift
//  SwiftUIView
//
//  Created by Pho Hale on 8/12/21.
//

import SwiftUI



struct DayPropertyIndicatorViewModel: Identifiable {
	var id: UUID = UUID()


	var fillColor: Color
	var systemBaseImageName: String
	// Alignment

	internal init(fillColor: Color, systemBaseImageName: String) {
		self.fillColor = fillColor
		self.systemBaseImageName = systemBaseImageName
	}
}


// MARK: -
// MARK: - DayPropertyIndicatorView: View
// Description: Adds a small visual indicator to a day cell, like a dot to indicate an event on that day.
struct DayPropertyIndicatorView: View {
//	@State var systemImageBaseName: String = "circle"
//	@State var fillColor: Color = .yellow

	var modelView: DayPropertyIndicatorViewModel = DayPropertyIndicatorViewModel(fillColor: .yellow, systemBaseImageName: "circle")

	private var systemImageFilledName: String { return "\(modelView.systemBaseImageName).fill"; }
	private var systemImageOutlineName: String { return modelView.systemBaseImageName; }


    var body: some View {
		ZStack {
			Image(systemName: systemImageFilledName)
				.foregroundColor(modelView.fillColor)
			Image(systemName: systemImageOutlineName)
				.foregroundColor(.black)
		}
		.padding(EdgeInsets(top: 2.0, leading: 2.0, bottom: 2.0, trailing: 2.0))
    }


//	init(with viewModel: DayPropertyIndicatorViewModel) {
//		self.systemImageBaseName = viewModel.systemBaseImageName
//		self.fillColor = viewModel.fillColor
//	}

}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DayPropertyIndicatorView()
			.foregroundColor(.yellow)

		DayPropertyIndicatorView(modelView: DayPropertyIndicatorViewModel(fillColor: .red, systemBaseImageName: "pin"))

//		DayPropertyIndicatorView(systemImageBaseName: "pin", fillColor: Color.red)


    }
}
