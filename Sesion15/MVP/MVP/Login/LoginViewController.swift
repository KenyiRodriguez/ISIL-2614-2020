//
//  LoginViewController.swift
//  MVP
//
//  Created by Kenyi Rodriguez on 10/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak private var txtUser      : UITextField!
    @IBOutlet weak private var txtPassword  : UITextField!
    @IBOutlet weak private var btnLogin     : UIButton!
    @IBOutlet weak private var loading      : UIActivityIndicatorView!
    
    lazy private var presenter: LoginPresenter = {
        return LoginPresenter(viewController: self)
    }()
    
    @IBAction func clickBtnLogin(_ sender: Any) {
        
        let user = self.txtUser.text ?? ""
        let password = self.txtPassword.text ?? ""
        
        self.presenter.doLogin(user: user, password: password)
    }
    
    func loadingLogin(_ isLoading: Bool) {
        
        isLoading ? self.loading.startAnimating() : self.loading.stopAnimating()
        self.btnLogin.alpha = isLoading ? 0.5 : 1
        self.btnLogin.isUserInteractionEnabled = isLoading ? false : true
    }
    
    func goToHomeController() {
        self.performSegue(withIdentifier: "HomeController", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}












//PARA TODO VIEWCONTROLLER
extension UIViewController {
    
    func showErrorMessage(_ errorMessage: String) {
        
        let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
