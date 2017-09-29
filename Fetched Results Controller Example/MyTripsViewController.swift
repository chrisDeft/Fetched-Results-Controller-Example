//
//  MyTripsViewController.swift
//  Travelbug
//
//  Created by Chris Adamson on 27/07/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

import UIKit
import CoreData

class MyTripsViewController: UIViewController, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    fileprivate let viewModel = MyTripsViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    public var selectedTrip: Trip? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        tableView?.dataSource = viewModel
        tableView?.delegate = self
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.estimatedRowHeight = 200
        
        viewModel.fetchedResultsController.delegate = self
        
        title = "My Trips"

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
        
        viewModel.addTrip()
    }
    
    
    // MARK: UITableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedTrip = viewModel.fetchedResultsController.object(at: indexPath)
        self.performSegue(withIdentifier: "editSelectedTrip", sender: self)
    }
    
    // MARK: NSFetchedResultsController Delegate
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
            
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .automatic)
            
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .automatic)
            
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .automatic)
            
        default:
            break
        }
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "editSelectedTrip" {
            
            if let destinationController = segue.destination as? EditTripViewController {
                
                destinationController.currentTrip = selectedTrip
                
            }
        }
    }
    
    

    

}
