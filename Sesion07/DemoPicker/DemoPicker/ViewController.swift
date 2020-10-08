//
//  ViewController.swift
//  DemoPicker
//
//  Created by Kenyi Rodriguez on 10/8/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtDate      : AMUITextField!
    @IBOutlet weak var txtDocument  : AMUITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        if let controller = segue.destination as? DatePickerSelectViewController {
            controller.delegate = self
            
        }else if let controller = segue.destination as? PickerOptionViewController {
            controller.delegate = self
            controller.arrayData = ["DNI", "CE", "PASS"]
        }
    }
}

extension ViewController: PickerOptionViewControllerDelegate {
    
    func pickerOptionViewController(_ controller: PickerOptionViewController, didSelectOption option: Any) {
        self.txtDocument.text = "\(option)"
    }
}

extension ViewController: DatePickerSelectViewControllerDelegate {
    
    func datePickerSelectViewController(_ controller: DatePickerSelectViewController, didSelectDate date: Date) {
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "EEEE dd 'de' MMMM 'del' yyyy 'a las' HH:mm 'horas'"
        dateFormat.locale = Locale(identifier: "es_PE")
        
        let textDate = dateFormat.string(from: date)
        
        self.txtDate.text = textDate
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if textField == self.txtDate {
            self.performSegue(withIdentifier: "DatePickerSelectViewController", sender: nil)
            return false
            
        }else if textField == self.txtDocument {
            self.performSegue(withIdentifier: "PickerOptionViewController", sender: nil)
            return false
            
        }
        
        return true
        
    }
}

