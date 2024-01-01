//
//  ItemsViewModel.swift
//  CoreData-CRUD
//
//  Created by Rayan Khan on 1/1/24.
//

import Foundation
import CoreData

class ItemsViewModel: ObservableObject {
    @Published var items: [Item] = []
    private let viewContext: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        viewContext = context
        fetchItems()
    }

    func fetchItems() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        do {
            items = try viewContext.fetch(request)
        } catch {
            print("Error fetching items: \(error)")
        }
    }

    func addItem(name: String) {
        let newItem = Item(context: viewContext)
        newItem.name = name
        saveContext()
    }

    func updateItem(_ item: Item, with newName: String) {
        item.name = newName
        saveContext()
    }

    func deleteItem(_ item: Item) {
        viewContext.delete(item)
        saveContext()
    }

    private func saveContext() {
        do {
            try viewContext.save()
            fetchItems()
        } catch {
            print("Error saving context: \(error)")
        }
    }
}

