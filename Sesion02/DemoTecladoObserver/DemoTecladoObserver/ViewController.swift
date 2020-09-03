//
//  ViewController.swift
//  DemoTecladoObserver
//
//  Created by Kenyi Rodriguez on 9/3/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func clickCloseKeyboard(_ sender: Any) {
        print("CERRAR TECLADO ACCION")
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        print("EL TECLADO APARECE")
        
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        print(keyboardFrame)
        print(animationDuration)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        print("El TECLADO SE OCULTA")
    }
}

