//
//  ActivityView.swift
//  Habits
//
//  Created by Vincent Delmaestro on 09/09/2021.
//

import SwiftUI

struct ActivityView: View {
	
	@ObservedObject var tracker: TrackerViewModel
	@State var activity: Activity
	
    var body: some View {
		VStack {
			Text(activity.description)
				.font(.title)
				.padding(.bottom)
			
			Text("Completed \(activity.completionCount) time(s)")
				.foregroundColor(.secondary)
			
			Button("Completed") {
				updateActivityCompletionCount()
			}
			.padding()
			.foregroundColor(.white)
			.background(Color.blue)
			.clipShape(Capsule())
		}
		.navigationTitle(activity.title)
    }
	
	func updateActivityCompletionCount() {
		activity.completionCount += 1
		if let index = tracker.activities.firstIndex(where: {$0.title == activity.title}) {
			self.tracker.activities[index] = self.activity
		}
	}
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
		let tracker = TrackerViewModel()
		let activity = Activity(title: "Learn SwiftUI", description: "To improve my skills")
		ActivityView(tracker: tracker, activity: activity)
    }
}
