//
//  Folder+CoreDataClass.swift
//  LocationNotes
//
//  Created by Богдан Плакущий on 22.02.2023.
//
//

import Foundation
import CoreData

@objc(Folder)
public class Folder: NSManagedObject {
    class func newFolder(name: String) -> Folder {
        let folder = Folder(context: CoreDataManager.sharedInstance.managedObjecContext)
        
        folder.name = name
        folder.dataUpdate = Date()
        
        return folder
    }
    
    func addNote() -> Note {
            let newNote = Note(context: CoreDataManager.sharedInstance.managedObjecContext)
            
            newNote.folder = self
            newNote.dateUpdate = Date()
            
            return newNote
    }

}
