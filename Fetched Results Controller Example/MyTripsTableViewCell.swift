//
//  MyTripsTableViewCell.swift
//  Travelbug
//
//  Created by Chris Adamson on 27/07/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

import UIKit

class MyTripsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tripsImageView: UIImageView!
    @IBOutlet weak var tripsLastUpdatedLabel: UILabel!
    @IBOutlet weak var tripsTitleLabel: UILabel!
    @IBOutlet weak var tripsDateLabel: UILabel!
    @IBOutlet weak var tripsInfoButton: UIButton!
    
    var trip: TripDisplayData? {
        
        didSet {
            
            guard let data = trip else { return }
            
            tripsTitleLabel?.text = data.title
            tripsImageView?.image = data.image
            tripsDateLabel?.text = data.dateString
            tripsLastUpdatedLabel?.text = data.budgetString
            
            tripsInfoButton?.isHidden = true
            
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        tripsTitleLabel.font = UIFont(name: "Avenir-Light", size:28) ?? .systemFont(ofSize: 28)
        tripsTitleLabel.textColor = .white
        tripsLastUpdatedLabel.font = UIFont(name: "Avenir-Light", size:20) ?? .systemFont(ofSize: 20)
        tripsLastUpdatedLabel.textColor = .white
        tripsDateLabel.font = UIFont(name: "Avenir-Light", size:20) ?? .systemFont(ofSize: 20)
        tripsDateLabel.textColor = .white
    }

    

}
