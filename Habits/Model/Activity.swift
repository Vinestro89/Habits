//
//  Activity.swift
//  Habits
//
//  Created by Vincent Delmaestro on 09/09/2021.
//

import Foundation

struct Activity: Identifiable, Codable {
	var id = UUID()
	let title: String
	let description: String
	var completionCount = 0
}
