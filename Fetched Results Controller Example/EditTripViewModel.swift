//
//  EditTripViewModel.swift
//  FRC Demo
//
//  Created by Chris Adamson on 17/08/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

import UIKit

protocol EditTripViewModel {
    
    var title: Dynamic<String> { get }
    var image: UIImage { get }
    var startDate: Dynamic<String> { get }
    var endDate: Dynamic<String> { get }
    var budget: Dynamic<String> { get }
    
    func titleChanged(to newTitle:String)
    func startDateChanged(to newStartDate:Date)
    func endDateChanged(to newEndDate:Date)
    func budgetChanged(to newBudget:String)
    
}

class EditTripViewModelFromTrip: NSObject, EditTripViewModel {
    
    let trip: Trip
    
    let numberFormatter = NumberFormatter()
    let dateFormatter = DateFormatter()
    
    let title: Dynamic<String>
    var image: UIImage
    let startDate: Dynamic<String>
    let endDate: Dynamic<String>
    let budget: Dynamic<String>
    
    init(withTrip trip:Trip) {
        
            self.trip = trip
        
            self.title = Dynamic(trip.title)
            self.image = UIImage(data: trip.image)!
            
            dateFormatter.calendar = Calendar.current
            dateFormatter.dateFormat = "d MMM yy"
            
            self.startDate = Dynamic(dateFormatter.string(from: trip.startDate))
            self.endDate = Dynamic(dateFormatter.string(from: trip.endDate))
        
            numberFormatter.numberStyle = .currency
            numberFormatter.locale = Locale.current
            
            self.budget = Dynamic(numberFormatter.string(from: trip.budget)!)
    }
    
    func titleChanged(to newTitle:String) {
        
        title.value = newTitle
        trip.title = newTitle
    }
    
    func startDateChanged(to newStartDate: Date) {
        
        startDate.value = dateFormatter.string(from: newStartDate)
        trip.startDate = newStartDate
    }
    
    func endDateChanged(to newEndDate:Date) {
        
        endDate.value = dateFormatter.string(from: newEndDate)
        trip.endDate = newEndDate
    }
    
    func budgetChanged(to newBudget: String) {
        
        budget.value = newBudget
        trip.budget = numberFormatter.number(from: newBudget)?.decimalValue as NSDecimalNumber!
    }
    
    
}



