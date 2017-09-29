//
//  UIColor+CustomColors.swift
//  Travelbug
//
//  Created by Chris Adamson on 22/07/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

import UIKit

extension UIColor {
    
    class var darkTeal: UIColor {
        
        return UIColor(red: 57.0/255.0, green: 142.0/255.0, blue: 123.0/255.0, alpha: 1.0)
    }
    
    class var travel: UIColor {
        
        return UIColor(red:255.0/255.0, green:44.0/255.0, blue:0.0/255.0, alpha:1.0)
    }
    
    class var food: UIColor {
        
        return UIColor(red:56.0/255.0, green:162.0/255.0, blue:146.0/255.0, alpha:1.0)
    }
    
    class var drinks: UIColor {
        
        return UIColor(red:122.0/255.0, green:57.0/255.0, blue:109.0/255.0, alpha:1.0)
    }
    
    class var accommodation: UIColor {
        
        return UIColor(red:28.0/255.0, green:0.0/255.0, blue:130.0/255.0, alpha:1.0)
    }
    
    class var activities: UIColor {
        
        return UIColor(red:250.0/255.0, green:173.0/255.0, blue:22.0/255.0, alpha:1.0)
    }
    
    class var entertainment: UIColor {
        
        return UIColor.cyan
    }
    
    class var shopping: UIColor {
        
        return UIColor(red:0.0/255.0, green:173.0/255.0, blue:239.0/255.0, alpha:1.0)
    }
    
    class var health: UIColor {
        
        return UIColor(red:190.0/255.0, green:72.0/255.0, blue:137.0/255.0, alpha:1.0)
    }
    
    class var planning: UIColor {
        
        return UIColor(red:240.0/255.0, green:126.0/255.0, blue:47.0/255.0, alpha:1.0)
    }
    
    class var communication: UIColor {
        
        return UIColor(red:100.0/255.0, green:31.0/255.0, blue:172.0/255.0, alpha:1.0)
    }
    
    class var pampering: UIColor {
        
        return UIColor(red:236.0/255.0, green:0.0/255.0, blue:139.0/255.0, alpha:1.0)
    }
    
    class var souvenirs: UIColor {
        
        return UIColor(red:64.0/255.0, green:172.0/255.0, blue:72.0/255.0, alpha:1.0)
    }
    
    class func colorForCategory(category: String) -> UIColor? {
        
        let colorDictionary = ["transport":UIColor.travel,"food":UIColor.food,"drinks":UIColor.drinks,"accomodation":UIColor.accommodation,"pampering":UIColor.pampering,"activities":UIColor.activities,"entertainment":UIColor.entertainment,"shopping":UIColor.shopping,"health":UIColor.health,"planning":UIColor.planning,"communication":UIColor.communication,"souvenirs":UIColor.souvenirs]
        
        return colorDictionary[category]
        
    }
    
}
