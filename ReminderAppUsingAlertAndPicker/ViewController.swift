//
//  ViewController.swift
//  ReminderAppUsingAlertAndPicker
//
//  Created by student on 2/25/24.
//

import UIKit

class PasswordViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.numberOfLines = 0
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        showPasswordAlert()
    }

    func showPasswordAlert() {
        let alert = UIAlertController(title: "Login", message: "Enter your password to continue", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        }

        let okAction = UIAlertAction(title: "Login", style: .default) { [weak self] _ in
            if let passwordTextField = alert.textFields?.first,
               let password = passwordTextField.text,
               !password.isEmpty {
                self?.resultLabel.text = "Welcome! 🎉"
            } else {
                self?.resultLabel.text = "Invalid password. Please try again."
            }
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alert.addAction(okAction)
        alert.addAction(cancelAction)

        present(alert, animated: true, completion: nil)
    }
}


import UIKit

class DateViewController: UIViewController {
    
    @IBOutlet var datePicker: UIDatePicker!
    
    let dateFormatter: DateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        showAlert(dateTime: dateFormatter.string(from: sender.date))
    }
    
    @IBAction func getCurrentDateTime(_ sender: UIButton) {
        showAlert(dateTime: dateFormatter.string(from: datePicker.date))
    }
    
    func showAlert(dateTime: String) {
        let alert = UIAlertController(title: "Selected Date and Time", message: "\(dateTime)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}
class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var myPicker: UIPickerView!
    @IBOutlet var contextLabel: UILabel!

    var componentOne: [String] = [String]()
    var componentTwo: [String] = [String]()
    var componentThree: [String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.delegate = self
        myPicker.dataSource = self
        componentOne = ["Cat", "Dog", "Hamster", "Lizard", "Parrot", "Goldfish"]
        componentTwo = ["House", "Apartment", "Condo", "RV"]
        componentThree = ["Indoor", "Outdoor"]

        // Customize Picker Appearance
        myPicker.backgroundColor = .lightGray
        myPicker.layer.borderWidth = 1.0
        myPicker.layer.borderColor = UIColor.darkGray.cgColor

        // Set Clear Instructions
        contextLabel.text = "Select a pet, housing, and environment:"
    }

    // MARK: - UIPickerViewDataSource

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return componentOne.count
        case 1: return componentTwo.count
        case 2: return componentThree.count
        default: return 0
        }
    }

    // MARK: - UIPickerViewDelegate

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0: return "Pet: \(componentOne[row])"
        case 1: return "Housing: \(componentTwo[row])"
        case 2: return "Environment: \(componentThree[row])"
        default: return nil
        }
    }

    // MARK: - User-Friendly Alert

    func showAlert(category: String) {
        let alert = UIAlertController(title: "Selected Category", message: "\(category)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

