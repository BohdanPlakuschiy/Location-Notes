//
//  ImageNote+CoreDataProperties.swift
//  LocationNotes
//
//  Created by Богдан Плакущий on 22.02.2023.
//
//

import Foundation
import CoreData


extension ImageNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageNote> {
        return NSFetchRequest<ImageNote>(entityName: "ImageNote")
    }

    @NSManaged public var imageBig: Data?
    @NSManaged public var note: Note?

}

extension ImageNote : Identifiable {

}
