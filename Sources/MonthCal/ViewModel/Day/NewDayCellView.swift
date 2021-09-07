//
//  NewDayCellView.swift
//  NewDayCellView
//
//  Created by Pho Hale on 8/26/21.
//

import SwiftUI

////////////////////////////////////////////////////////////////////
//MARK: -
//MARK: - NewDayCellView
/*
  A very good looking Day cell that I generated using "DetailsPro" and one of their built-in templates.
 */

struct NewDayCellView: View {
	var body: some View {
		VStack(spacing: 8) {
			HStack {
				VStack(alignment: .leading, spacing: 0) {
					Text("SATURDAY")
						.font(.system(size: 10, weight: .medium, design: .default))
						.foregroundColor(Color.red)
					Text("3")
						.font(.system(size: 32, weight: .light, design: .default))
				}
				Spacer()
			}
			HStack(spacing: 6) {
				Rectangle()
					.frame(width: 4)
					.clipped()
					.cornerRadius(2)
					.foregroundColor(Color.green)
				VStack(alignment: .leading, spacing: 2) {
					Text("Design Review")
						.font(.system(size: 13, weight: .medium, design: .default))
					Text("Apple Park")
						.font(.caption)
					Text("4:00 PM - 5:00 PM")
						.font(.caption)
						.foregroundColor(Color.secondary)
				}
				Spacer()
			}
			Spacer()
		}
		.padding(.vertical, 16)
		.padding(.leading, 16)
	}
}


struct NewDayCellView_Previews: PreviewProvider {
    static var previews: some View {
        NewDayCellView()
    }
}
