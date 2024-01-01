//
//  ContentView.swift
//  CoreData-CRUD
//
//  Created by Rayan Khan on 1/1/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ItemsViewModel(context: PersistenceController.shared.container.viewContext)
    
    var body: some View {
        ItemView(viewModel: viewModel)
            .onOpenURL { url in
                handleDeepLink(url)
            }
    }
    
    private func handleDeepLink(_ url: URL) {
        if url.absoluteString.contains("item=") {
            let itemValue =  url.absoluteString.replacingOccurrences(of: "crud://item=", with: "")
            viewModel.addItem(name: itemValue)
        }
    }
}

