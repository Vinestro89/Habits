//
//  TrackerViewModel.swift
//  Habits
//
//  Created by Vincent Delmaestro on 09/09/2021.
//

import Foundation

class TrackerViewModel: ObservableObject {
	@Published var activities = [Activity]()
}
