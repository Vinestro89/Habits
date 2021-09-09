//
//  TrackerViewModel.swift
//  Habits
//
//  Created by Vincent Delmaestro on 09/09/2021.
//

import Foundation

class TrackerViewModel: ObservableObject {
	@Published var activities = [Activity]() {
		didSet {
			let encoder = JSONEncoder()
			if let encoded = try? encoder.encode(activities) {
				UserDefaults.standard.set(encoded, forKey: "activities")
			}
		}
	}
	
	init() {
		if let activities = UserDefaults.standard.data(forKey: "activities") {
			let decoder = JSONDecoder()
			if let decoded = try? decoder.decode([Activity].self, from: activities) {
				self.activities = decoded
				return
			}
		}
		
		self.activities = []
	}
}
