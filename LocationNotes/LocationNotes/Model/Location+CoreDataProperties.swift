//
//  Location+CoreDataProperties.swift
//  LocationNotes
//
//  Created by Богдан Плакущий on 22.02.2023.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var note: Note?

}

extension Location : Identifiable {

}
