//
//  LoginPresenter.swift
//  MVP
//
//  Created by Kenyi Rodriguez on 10/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class LoginPresenter {
    
    private weak var viewController: LoginViewController?
    
    init(viewController: LoginViewController) {
        self.viewController = viewController
    }
    
    func doLogin(user: String, password: String) {
        
        if user.count == 0 {
            self.viewController?.showErrorMessage("Ingrese un usuario")
        }else if password.count == 0 {
            self.viewController?.showErrorMessage("Ingrese una contaseña")
        }else {
            
            self.viewController?.loadingLogin(true)
            
            LoginModel.doLogin(user: user, password: password) {
                
                self.viewController?.loadingLogin(false)
                self.viewController?.goToHomeController()
            }
        }
    }
}
