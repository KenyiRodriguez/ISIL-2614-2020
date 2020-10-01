//
//  ViewController.swift
//  ManejoDeInputs
//
//  Created by Kenyi Rodriguez on 10/1/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDocument: UITextField!
    
    @IBAction func tapToCloseKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateBorderSelect(false, toTextField: self.txtName)
        self.updateBorderSelect(false, toTextField: self.txtDocument)
    }
    
    func updateBorderSelect(_ isSelect: Bool, toTextField textField: UITextField) {
        
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = isSelect ? UIColor(displayP3Red: 0.5, green: 1, blue: 0.5, alpha: 1).cgColor : UIColor.lightGray.cgColor
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 0)
        textField.layer.shadowRadius = 5
        textField.layer.shadowOpacity = 0.1
    }
}

extension ViewController: UIPickerViewDelegate {
    
}

extension ViewController: UIScrollViewDelegate {
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        self.updateBorderSelect(true, toTextField: textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        self.updateBorderSelect(false, toTextField: textField)
    }
}
