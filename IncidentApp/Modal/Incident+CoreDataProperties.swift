//
//  Incident+CoreDataProperties.swift
//  IncidentApp
//
//  Created by Shubham Kumar on 21/03/20.
//  Copyright © 2020 Shubham Kumar. All rights reserved.
//
//

import Foundation
import CoreData


extension Incident {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Incident> {
        return NSFetchRequest<Incident>(entityName: "Incident")
    }

    @NSManaged public var descriptions: String?
    @NSManaged public var location: String?
    @NSManaged public var machineid: String?
    @NSManaged public var machinename: String?
    @NSManaged public var submissiontime: String?

}
