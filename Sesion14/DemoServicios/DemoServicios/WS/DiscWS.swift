//
//  DiscWS.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 3/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class DiscWS {
    
    class func getAllDisc(_ success: @escaping Discs) {
        
        WebServiceManager.doRequest(.get, urlString: WebServicesURL.getDiscs) { (response) in
            
            let json = response as? WebServiceManager.JSON ?? [:]
            
            let products = json["productos"] as? WebServiceManager.JSON ?? [:]
            let discsWS = products["discos"] as? [WebServiceManager.JSON] ?? []
            
            var arrayDiscs = [DiscBE]()
            
            for discJSON in discsWS {
                let objDisc = DiscBE(json: discJSON)
                arrayDiscs.append(objDisc)
            }
            
            success(arrayDiscs)
        }
    }
    
    class func doLogin(documentNumber: String, documentType: Int, password: String, deviceToken: String, success: @escaping Success) {
        
        let json : WebServiceManager.JSON = ["documentNumber"   : documentNumber,
                                             "documentType"     : documentType,
                                             "password"         : password,
                                             "deviceToken"      : deviceToken]

        WebServiceManager.doRequest(.post, urlString: WebServicesURL.login, bodyParams: json) { (response) in
            print(response ?? "SIN RESPUESTA")
            success()
        }
    }
}


