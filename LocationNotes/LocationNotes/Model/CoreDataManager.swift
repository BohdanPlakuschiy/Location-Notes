//
//  CoreDataManager.swift
//  LocationNotes
//
//  Created by Богдан Плакущий on 22.02.2023.
//

import UIKit
import CoreData


var folder: [Folder] {
    let recvest = NSFetchRequest<Folder>(entityName: "Folder")
    
    let sd = NSSortDescriptor(key: "name", ascending: true)
    recvest.sortDescriptors = [sd]
    
    let array = try? CoreDataManager.sharedInstance.managedObjecContext.fetch(recvest)
    
    if array != nil {
        return array!
    }
    
    return[]
}

var notes: [Note] {
    let recvest = NSFetchRequest<Note>(entityName: "Note")
    
    let sd = NSSortDescriptor(key: "dateUpdate", ascending: false)
    recvest.sortDescriptors = [sd]
    
    let array = try? CoreDataManager.sharedInstance.managedObjecContext.fetch(recvest)
    
    if array != nil {
        return array!
    }
    
    return[]
}



class CoreDataManager {
    
    static let sharedInstance = CoreDataManager()
    
    private init() {}
    
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
