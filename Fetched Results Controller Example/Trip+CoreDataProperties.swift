//
//  Trip+CoreDataProperties.swift
//  FRC Demo
//
//  Created by Chris Adamson on 15/08/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

import Foundation
import CoreData


extension Trip {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Trip> {
        return NSFetchRequest<Trip>(entityName: "Trip")
    }

    @NSManaged public var title: String
    @NSManaged public var image: Data
    @NSManaged public var startDate: Date
    @NSManaged public var endDate: Date
    @NSManaged public var budget: NSDecimalNumber

}
