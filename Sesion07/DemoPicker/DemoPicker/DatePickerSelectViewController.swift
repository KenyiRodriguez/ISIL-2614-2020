//
//  DatePickerSelectViewController.swift
//  DemoPicker
//
//  Created by Kenyi Rodriguez on 10/8/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

protocol DatePickerSelectViewControllerDelegate {
    func datePickerSelectViewController(_ controller: DatePickerSelectViewController, didSelectDate date: Date)
}

class DatePickerSelectViewController: UIViewController {

    @IBOutlet weak var pickerViewContent: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerSelectViewControllerDelegate?

    @IBAction func tapToClose(_ sender: Any) {
        
        UIView.animate(withDuration: 0.25, animations: {
            
            self.view.backgroundColor = .clear
            self.pickerViewContent.transform = CGAffineTransform(translationX: 0, y: self.pickerViewContent.frame.height)
            
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @IBAction func changeDateSelect(_ datePicker: UIDatePicker) {
        self.delegate?.datePickerSelectViewController(self, didSelectDate: datePicker.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let minimunDate = dateFormatter.date(from: "07/10/2020")
        
        self.datePicker.minimumDate = minimunDate
        self.view.backgroundColor = .clear
        self.pickerViewContent.transform = CGAffineTransform(translationX: 0, y: self.pickerViewContent.frame.height)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            
            self.view.backgroundColor = UIColor(named: "black_50")
            self.pickerViewContent.transform = .identity
            
        }, completion: nil)
        
    }
}
