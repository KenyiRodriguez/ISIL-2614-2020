//
//  PickerOptionViewController.swift
//  DemoPicker
//
//  Created by Kenyi Rodriguez on 10/8/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

protocol PickerOptionViewControllerDelegate {
    func pickerOptionViewController(_ controller: PickerOptionViewController, didSelectOption option: Any)
}


class PickerOptionViewController: UIViewController {

    @IBOutlet weak var pickerViewContent: UIView!
    @IBOutlet weak var picker: UIPickerView!
    
    var arrayData = [String]()
    
    var delegate: PickerOptionViewControllerDelegate?
    
    @IBAction func tapToClose(_ sender: Any) {
        
        UIView.animate(withDuration: 0.25, animations: {
            
            self.view.backgroundColor = .clear
            self.pickerViewContent.transform = CGAffineTransform(translationX: 0, y: self.pickerViewContent.frame.height)
            
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

extension PickerOptionViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.arrayData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.arrayData[row]
    }
    
}

extension PickerOptionViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let selectItem = self.arrayData[row]
        self.delegate?.pickerOptionViewController(self, didSelectOption: selectItem)
    }
}

