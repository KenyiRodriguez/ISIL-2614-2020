//
//  PerfilViewController.swift
//  Ejemplo13
//
//  Created by Kenyi Rodriguez on 26/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController {
    
    @IBAction func clickBtnCerrarSesion(_ sender: Any) {
        
        self.tabBarController?.navigationController?.popToRootViewController(animated: true)
    }
}
