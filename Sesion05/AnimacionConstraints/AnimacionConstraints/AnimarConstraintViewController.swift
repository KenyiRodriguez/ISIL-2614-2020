//
//  AnimarConstraintViewController.swift
//  AnimacionConstraints
//
//  Created by Kenyi Rodriguez on 9/24/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class AnimarConstraintViewController: UIViewController {

    @IBOutlet weak var constraintHeightBox: NSLayoutConstraint!
    @IBOutlet weak var constraintWidthBox: NSLayoutConstraint!
    
    @IBAction func clickBtnAnimateSize(_ sender: Any) {
        
        let newWidth = CGFloat.random(in: 40...350)
        let newHeight = CGFloat.random(in: 40...350)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.4, options: .curveEaseOut, animations: {
            
            self.constraintWidthBox.constant = newWidth
            self.constraintHeightBox.constant = newHeight
            self.view.layoutIfNeeded() //IMPORTANTE PARA ANIMAR CONSTRAINTS
            
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
