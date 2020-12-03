//
//  DateManager.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 3/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

extension String {
    
    func toDateWithFormat(_ format: String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self) ?? Date()
    }
}

extension Date {
    
    func toStringWithFormat(_ format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
