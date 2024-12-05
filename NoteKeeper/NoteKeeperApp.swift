//
//  NoteKeeperApp.swift
//  NoteKeeper
//
//  Created by Spark Solutionz Inc on 05/12/2024.
//

import SwiftUI

@main
struct NoteKeeperApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
