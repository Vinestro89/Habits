//
//  Activity.swift
//  Habits
//
//  Created by Vincent Delmaestro on 09/09/2021.
//

import Foundation

struct Activity: Identifiable {
	let id = UUID()
	let title: String
	let description: String
}
