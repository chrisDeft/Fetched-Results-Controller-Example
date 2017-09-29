//
//  UIToolbar+DoneButton.swift
//  FRC Demo
//
//  Created by Chris Adamson on 29/08/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

import UIKit

extension UIToolbar {
    
    class func addDoneButton(textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done,
                                            target: textField, action: #selector(resignFirstResponder))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        textField.inputAccessoryView = keyboardToolbar
    }
    
    
}
