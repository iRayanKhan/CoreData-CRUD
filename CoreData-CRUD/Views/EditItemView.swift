//
//  EditItemView.swift
//  CoreData-CRUD
//
//  Created by Rayan Khan on 1/1/24.
//

import SwiftUI

struct EditItemView: View {
    @ObservedObject var viewModel: ItemsViewModel
    @Binding var editableItem: Item?
    @Environment(\.presentationMode) var presentationMode
    @State private var itemName: String = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $itemName)
            }
            .navigationBarItems(trailing: Button("Save") {
                if let item = editableItem {
                    viewModel.updateItem(item, with: itemName)
                } else {
                    viewModel.addItem(name: itemName)
                }
                presentationMode.wrappedValue.dismiss()
            })
            .onAppear {
                if let item = editableItem {
                    itemName = item.name ?? ""
                }
            }
            .navigationBarTitle("Edit Item")
        }
    }
}
