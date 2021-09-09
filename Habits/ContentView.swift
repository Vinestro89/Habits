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
					NavigationLink(destination: Text("")) {
						Text(activity.title)
							.font(.headline)
							.padding()
					}
				}
			}
			.navigationTitle("Habits")
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
