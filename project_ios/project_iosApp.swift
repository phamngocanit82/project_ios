//
//  project_iosApp.swift
//  project_ios
//
//  Created by An on 06/12/2022.
//

import SwiftUI

@main
struct project_iosApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
