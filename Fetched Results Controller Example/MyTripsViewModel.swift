//
//  MyTripsViewModel.swift
//  Travelbug
//
//  Created by Chris Adamson on 27/07/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

import UIKit
import CoreData

class MyTripsViewModel: NSObject {
    
    var fetchedResultsController: NSFetchedResultsController<Trip>!
    
    override init() {
        super.init()
        
        if fetchedResultsController == nil {
            
            let request = Trip.createFetchRequest()
            let sort = NSSortDescriptor(key: "startDate", ascending: false)
            request.sortDescriptors = [sort]
            request.fetchBatchSize = 20
            
            fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.sharedInstance.container.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        }
        
        do {
            
            try fetchedResultsController.performFetch()
            
        } catch {
            print("Fetch failed")
        }
        
        
    }
    
    func addTrip() {
        
        let newTrip = Trip(context: CoreDataStack.sharedInstance.container.viewContext)
        
        newTrip.title = "New Trip"
        newTrip.image = UIImageJPEGRepresentation(UIImage(named:"Raroisland")!, 1.0)!
        newTrip.startDate = Date()
        newTrip.endDate = Date()
        newTrip.budget = 1000
        
        CoreDataStack.sharedInstance.saveContext()
        
    }
    
}


extension MyTripsViewModel: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return fetchedResultsController.sections![section].name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let trip = fetchedResultsController.object(at: indexPath)
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MyTripsCell", for: indexPath) as? MyTripsTableViewCell {
        
            cell.trip = TripDisplayData(title: trip.title, image: trip.image, startDate: trip.startDate, endDate: trip.endDate, budget: trip.budget)
            
            return cell
            
            }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let trip = fetchedResultsController.object(at: indexPath)
            
            CoreDataStack.sharedInstance.container.viewContext.delete(trip)
            
            CoreDataStack.sharedInstance.saveContext()
        }
    }
    
}

struct TripDisplayData {
    
    var title: String
    var image: UIImage
    var dateString: String
    var budgetString: String
    
    init(title: String, image: Data, startDate: Date, endDate: Date, budget: NSDecimalNumber) {
        
        self.title = title
        self.image = UIImage(data: image)!
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.calendar = Calendar.current
        dateFormatter.dateFormat = "d MMM yy"
        
        self.dateString = dateFormatter.string(from: startDate) + "-" + dateFormatter.string(from: endDate)
        
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .currency
        
        self.budgetString = numberFormatter.string(from: budget)!
    }
}
