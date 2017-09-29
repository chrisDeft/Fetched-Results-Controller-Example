//
//  EditTripViewController.swift
//  FRC Demo
//
//  Created by Chris Adamson on 17/08/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

import UIKit

class EditTripViewController: UIViewController, UITextFieldDelegate {
    
    var currentTrip: Trip?
    
    @IBOutlet weak var tripImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var budgetTextField: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    
    var viewModel: EditTripViewModel? {
        
        didSet {

            guard let data = viewModel else { return }
            
            data.title.bindAndFire { [unowned self] in self.titleTextField.text = $0 }
            data.startDate.bindAndFire { [unowned self] in self.startDateTextField.text = $0 }
            data.endDate.bindAndFire { [unowned self] in self.endDateTextField.text = $0 }
            data.budget.bindAndFire { [unowned self] in self.budgetTextField.text = $0 }
            
            tripImageView?.image = data.image
            
        }
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "Edit Trip"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        
        viewModel = EditTripViewModelFromTrip(withTrip: currentTrip!)
        
        setUpTextFields()
    }
    
    @objc func doneTapped() {
        
        if let navC = navigationController {
            navC.popViewController(animated: true)
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == startDateTextField {
        
            let datePicker = UIDatePicker()
            datePicker.setPickerStyle()
            datePicker.date = (currentTrip?.startDate)!
            datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
            startDateTextField.inputView = datePicker
        
        }
        if textField == endDateTextField {
        
            let datePicker = UIDatePicker()
            datePicker.setPickerStyle()
            datePicker.date = (currentTrip?.endDate)!
            datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
            endDateTextField.inputView = datePicker
        
        }
        
        UIToolbar.addDoneButton(textField: textField)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == titleTextField {
            
            viewModel?.titleChanged(to: (titleTextField?.text)!)
            
        }
        if textField == budgetTextField {
            
            viewModel?.budgetChanged(to: (budgetTextField?.text)!)
            
        }
    }
    
    @objc func datePickerValueChanged(datePicker: UIDatePicker) {
        
        if startDateTextField.isFirstResponder {
            
            viewModel?.startDateChanged(to: datePicker.date)
            
        } else {
            
            viewModel?.endDateChanged(to: datePicker.date)
        }
        
    }
    
    func setUpTextFields() {
        
        titleTextField.delegate = self
        startDateTextField.delegate = self
        endDateTextField.delegate = self
        budgetTextField.delegate = self
        
        titleTextField.font = UIFont(name: "Avenir-Light", size:20) ?? .systemFont(ofSize: 20)
        startDateTextField.font = UIFont(name: "Avenir-Light", size:20) ?? .systemFont(ofSize: 20)
        endDateTextField.font = UIFont(name: "Avenir-Light", size:20) ?? .systemFont(ofSize: 20)
        budgetTextField.font = UIFont(name: "Avenir-Light", size:20) ?? .systemFont(ofSize: 20)
        
    }
    
    

}
