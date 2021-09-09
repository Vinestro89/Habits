//
//  ActivityView.swift
//  Habits
//
//  Created by Vincent Delmaestro on 09/09/2021.
//

import SwiftUI

struct ActivityView: View {
	
	var activity: Activity
	
    var body: some View {
		VStack {
			Text(activity.description)
		}
		.navigationTitle(activity.title)
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
		let activity = Activity(title: "Learn SwiftUI", description: "To improve my skills")
        ActivityView(activity: activity)
    }
}
