//
//  WebServiceManager.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 26/11/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

typealias JSON = [String : Any]

extension WebServiceManager {
    
    typealias Response = (_ response: Any?) -> Void

    enum Method: String {
        case get    = "GET"
        case post   = "POST"
        case put    = "PUT"
        case delete = "DELETE"
    }
}

class WebServiceManager {
    
    class func getDataRequest(_ params: JSON) -> Data? {
        
        do {
            let dataParams = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            return dataParams
            
        }catch {
            return nil
        }
    }
    
    
    class func doRequest(_ method: Method = .get, urlString: String, bodyParams: JSON = [:], success: @escaping Response) {
        
        let urlStringFormat = urlString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? ""
        
        guard let url = URL(string: urlStringFormat) else {
            print("Error en la URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = self.getDataRequest(bodyParams)
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.httpAdditionalHeaders = ["Conent-Type" : "application/json"]

        
        let session = URLSession(configuration: sessionConfiguration)
        
        let task = session.dataTask(with: request) { (data, urlResponse, error) in
            
            DispatchQueue.global(qos: .background).async {
                
                var response: Any?
                
                do {
                    response = try JSONSerialization.jsonObject(with: data ?? Data(), options: .allowFragments)
                }catch {
                    print("Error al intenter leer el JSON")
                }
                
                DispatchQueue.main.async {
                    success(response)
                }
            }
        }
        
        task.resume()
    }
}
