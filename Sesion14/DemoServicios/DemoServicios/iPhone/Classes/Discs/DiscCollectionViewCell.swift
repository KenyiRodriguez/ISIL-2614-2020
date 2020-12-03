//
//  DiscCollectionViewCell.swift
//  DemoServicios
//
//  Created by Kenyi Rodriguez on 3/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class DiscCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgDisc: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    var objDisc: DiscBE! {
        didSet { self.updateData() }
    }
    
    private func updateData() {
        
        //Meteora (2003)
        self.lblName.text = "\(self.objDisc.name) (\(self.objDisc.releaseYear))"
        self.imgDisc.downloadImageInUrlString(self.objDisc.urlImage) { (image, urlImage) in
            
            if self.objDisc.urlImage == urlImage {
                self.imgDisc.image = image
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        self.imgDisc.layer.cornerRadius = 10
        
        self.alpha = 0
        self.transform = CGAffineTransform(translationX: 0, y: 100).scaledBy(x: 0.8, y: 0.8)
        
        let duration: Double = 0.6
        let delay = Double.random(in: 0...(duration*0.8))
        
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.4, options: .curveEaseOut, animations: {
            
            self.alpha = 1
            self.transform = .identity
            
        }, completion: nil)
    }
}
