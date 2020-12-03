//
//  DiscBL.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 3/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import Foundation

class DiscBL {
    
    class func getAllDisc(_ success: @escaping Discs) {
        
        DiscWS.getAllDisc { (arrayDisc) in
            
            let arraySorted = arrayDisc.sorted(by: {
                $0.releaseYear > $1.releaseYear
            })
            
            success(arraySorted)
        }
    }
}
