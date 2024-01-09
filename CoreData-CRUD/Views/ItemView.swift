//
//  ItemView.swift
//  CoreData-CRUD
//
//  Created by Rayan Khan on 1/1/24.
//

import SwiftUI

struct ItemView: View {
    @StateObject var viewModel: ItemsViewModel
    @State private var showingEditView = false
    @State private var editableItem: Item?

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items, id: \.self) { item in
                    Text(item.name ?? "Untitled")
                        .onTapGesture {
                            self.editableItem = item
                            self.showingEditView = true
                        }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        let item = viewModel.items[index]
                        viewModel.deleteItem(item)
                    }
                }
            }
            .navigationBarTitle("Items")
            .navigationBarItems(trailing: Button(action: {
                self.editableItem = nil
                self.showingEditView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingEditView) {
                EditItemView(viewModel: viewModel, editableItem: $editableItem)
            }
        }            .navigationViewStyle(StackNavigationViewStyle())
    }
}
