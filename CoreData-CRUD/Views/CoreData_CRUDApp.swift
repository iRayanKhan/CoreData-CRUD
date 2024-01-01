//
//  CoreData_CRUDApp.swift
//  CoreData-CRUD
//
//  Created by Rayan Khan on 1/1/24.
//

import SwiftUI

@main
struct CoreData_CRUDApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
