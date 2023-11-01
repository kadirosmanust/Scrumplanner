//
//  ScrumplannerApp.swift
//  Scrumplanner
//
//  Created by Osman Ust on 31.10.2023.
//

import SwiftUI

@main
struct ScrumplannerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
