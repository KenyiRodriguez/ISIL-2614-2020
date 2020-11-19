//
//  ConfirmacionViewController.swift
//  Remember
//
//  Created by Kenyi Rodriguez on 19/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ConfirmacionViewController: UIViewController {
    
    @IBAction func clickBtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MODO NOOB =D
    func obtenerControllerLogin() -> UIViewController? {
        
        let viewControllers = self.navigationController?.viewControllers ?? []
        
        for controller in viewControllers {
            if controller is LoginViewController {
                return controller
            }
        }
        
        return nil
    }
    
    @IBAction func clickBtnGoToLogin(_ sender: Any) {
        
        //MODO NOOB =D
//        guard let controller = self.obtenerControllerLogin()
//        else {
//            return
//        }
        
        //MODO PRO =D
        guard let controller = self.navigationController?.viewControllers.first(where: { $0 is LoginViewController })
        else {
            return
        }
        self.navigationController?.popToViewController(controller, animated: true)
    }
}
