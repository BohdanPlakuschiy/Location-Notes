//
//  CoreDataManager.swift
//  LocationNotes
//
//  Created by Богдан Плакущий on 22.02.2023.
//

import UIKit
import CoreData

class CoreDataManager {
    
    static let sharedInstance = CoreDataManager()
    
    var managedObjecContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
        lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "LocationNotes")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()
        
        func saveContext () {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
    
}
