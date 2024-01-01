//
//  ContentView.swift
//  CoreData-CRUD
//
//  Created by Rayan Khan on 1/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ItemView(viewModel: ItemsViewModel(context: PersistenceController.shared.container.viewContext))
    }
}

#Preview {
    ContentView()
}
