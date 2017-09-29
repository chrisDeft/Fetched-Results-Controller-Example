//
//  CoreDataStack.swift
//  Travelbug
//
//  Created by Chris Adamson on 15/08/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    var container: NSPersistentContainer!
    
    static let sharedInstance = CoreDataStack()
    
    private init () {
    
        container = NSPersistentContainer(name: "Model")
        
        container.loadPersistentStores { storeDescription, error in
            
            if let error = error {
                print("Unresolved error\(error)")
            }
        }
    
    }
    
    func saveContext() {
        
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print("An error occured while saving: \(error)")
            }
        }
    }
    
}
