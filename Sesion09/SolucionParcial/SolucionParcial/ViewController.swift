//
//  ViewController.swift
//  SolucionParcial
//
//  Created by Kenyi Rodriguez on 10/29/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var constraintBottomScroll: NSLayoutConstraint!
    
    var isColapse = false
    
    @IBAction func clickBtnSeeMore(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3) {
            
            self.lblContent.numberOfLines = self.isColapse ? 0 : 2
            sender.setTitle(self.isColapse ? "Ver menos" : "Ver más", for: .normal)
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
        let keyboardRect =  notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let time = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: time) {
            
            self.constraintBottomScroll.constant = keyboardRect.height
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
        let time = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: time) {
            
            self.constraintBottomScroll.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }


}

