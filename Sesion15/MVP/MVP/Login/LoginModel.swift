//
//  LoginModel.swift
//  MVP
//
//  Created by Kenyi Rodriguez on 10/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

typealias Success = () -> Void

class LoginModel {
    
    class func doLogin(user: String, password: String, success: @escaping Success) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            success()
        }
    }
}
