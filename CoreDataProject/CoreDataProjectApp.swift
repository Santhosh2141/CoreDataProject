//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Santhosh Srinivas on 07/09/25.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
