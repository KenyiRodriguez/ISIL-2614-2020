//
//  ViewController.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 26/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://jsonplaceholder.typicode.com/todos/clients?id=123&name=juan"
        
        WebServiceManager.doRequest(.get, urlString: urlString) { (response) in
            print(response ?? "SIN RESPUESTA")
        }
        
        let json: JSON = ["nombre" : "Kenyi",
                          "apellido": "Rodriguez"]
        
        WebServiceManager.doRequest(.post, urlString: urlString, bodyParams: json) { (response) in
            print(response ?? "SIN RESPUESTA")
        }
        
    }
}

