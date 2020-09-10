//
//  ViewController.swift
//  DemoDelegadosParte2
//
//  Created by Kenyi Rodriguez on 9/10/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func clickBtnCreate(_ sender: Any) {
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        let posx = CGFloat.random(in: 0...width)
        let posy = CGFloat.random(in: 0...height)
        
        let frame = CGRect(x: posx, y: posy, width: 80, height: 80)
        let boxView = BoxView(frame: frame)
        self.view.addSubview(boxView)
        boxView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
}

extension ViewController: BoxViewDelegate {
    
    func boxViewTapInView(_ view: BoxView) {
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: {
            
//            view.changeRandomBackgroundColor()
            view.changeRandomCenter()
            view.changeAngleRotation()
            
        }) { (_) in
            
            view.transform = .identity
            print("Termino la animación")
        }
    }
}

