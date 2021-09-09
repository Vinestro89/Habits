//
//  ContentView.swift
//  Habits
//
//  Created by Vincent Delmaestro on 09/09/2021.
//

import SwiftUI

struct ContentView: View {
	
	@State private var isShowingAddActivity = false
	@ObservedObject var tracker = TrackerViewModel()
	
    var body: some View {
		NavigationView {
			List {
				ForEach(tracker.activities) { activity in
					NavigationLink(destination: ActivityView(activity: activity)) {
						VStack(alignment: .leading) {
							Text(activity.title)
								.font(.headline)
							Text(activity.description)
								.font(.caption)
								.foregroundColor(.secondary)
						}
						.padding()
					}
				}
				.onDelete(perform: removeActivities)
			}
			.navigationTitle("Habits")
			.navigationBarItems(leading: EditButton(), trailing:
				Button(action: {
					self.isShowingAddActivity = true
				}) {
					Image(systemName: "plus")
				}
			)
		}
		.sheet(isPresented: $isShowingAddActivity) {
			AddActivityView(tracker: self.tracker)
		}
    }
	
	func removeActivities(at offsets: IndexSet) {
		tracker.activities.remove(atOffsets: offsets)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
