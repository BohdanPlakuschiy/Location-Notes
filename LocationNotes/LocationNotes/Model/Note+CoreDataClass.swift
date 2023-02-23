//
//  Note+CoreDataClass.swift
//  LocationNotes
//
//  Created by Богдан Плакущий on 22.02.2023.
//
//

import Foundation
import CoreData
import UIKit

@objc(Note)
public class Note: NSManagedObject {
    
    class func newNote(name: String) -> Note {
        let newNote = Note(context: CoreDataManager.sharedInstance.managedObjecContext)
        
        newNote.name = name
        newNote.dateUpdate = Date()
        
        return newNote
    }
    
    func addImage(image: UIImage) {
        let imageNote = ImageNote(context: CoreDataManager.sharedInstance.managedObjecContext)
        imageNote.imageBig = image.jpegData(compressionQuality: 1.0)
        self.image = imageNote
    }
    
    func addLocation(latitude: Double, longitude: Double) {
        let location = Location(context: CoreDataManager.sharedInstance.managedObjecContext)
        
        location.latitude = latitude
        location.longitude = longitude
        self.location = location
        
    }

}
