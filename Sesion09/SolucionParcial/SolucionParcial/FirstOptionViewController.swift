//
//  FirstOptionViewController.swift
//  SolucionParcial
//
//  Created by Kenyi Rodriguez on 10/29/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class FirstOptionViewController: UIViewController {

    @IBOutlet weak var viewToAnimate: UIView!
    
    
    @IBAction func clickBtnBack(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapToAnimate(_ sender: Any) {
        
        let posx = CGFloat.random(in: 0...self.view.frame.width)
        let posy = CGFloat.random(in: 0...self.view.frame.height)
        
        UIView.animate(withDuration: 0.5) {
            self.viewToAnimate.center = CGPoint(x: posx, y: posy)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
