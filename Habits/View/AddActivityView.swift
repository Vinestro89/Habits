//
//  AddActivityView.swift
//  Habits
//
//  Created by Vincent Delmaestro on 09/09/2021.
//

import SwiftUI

struct AddActivityView: View {
	
	@ObservedObject var tracker: TrackerViewModel
	@Environment(\.presentationMode) var presentationMode
	
	@State private var title = ""
	@State private var description = ""
	
    var body: some View {
		NavigationView {
			Form {
				TextField("Title", text: $title)
				TextField("Description", text: $description)
			}
			.navigationTitle("New activity")
			.navigationBarItems(trailing: Button("Save") {
				let activity = Activity(title: title, description: description)
				self.tracker.activities.append(activity)
				self.presentationMode.wrappedValue.dismiss()
			}
			.disabled(title.isEmpty)
			)
		}
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
		AddActivityView(tracker: TrackerViewModel())
    }
}
