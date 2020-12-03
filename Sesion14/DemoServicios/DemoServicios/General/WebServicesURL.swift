//
//  WebServicesURL.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 3/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

struct WebServicesURL {
    
    static private var baseURL = "https://ipas-ios.s3.amazonaws.com/"
    
    static var getDiscs = baseURL + "jsonTest/discos.json"
    static var login    = baseURL + "jsonTest/login"
}
