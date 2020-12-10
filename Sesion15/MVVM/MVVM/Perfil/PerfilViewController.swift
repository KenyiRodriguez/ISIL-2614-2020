//
//  ViewController.swift
//  MVVM
//
//  Created by Kenyi Rodriguez on 10/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController {

    @IBOutlet weak var lblNombre1: UILabel!
    @IBOutlet weak var lblNombre2: UILabel!
    
    lazy var viewModel: PerfilViewModel = {
        let viewModel = PerfilViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.obtenerPerfil()
    }
}

extension PerfilViewController: PerfilViewModelDelegate {
    
    func perfilViewModelUpdatePerfil(_ perfilViewModel: PerfilViewModel) {
        
        self.lblNombre2.attributedText = perfilViewModel.nombreCompleto
    }
}
