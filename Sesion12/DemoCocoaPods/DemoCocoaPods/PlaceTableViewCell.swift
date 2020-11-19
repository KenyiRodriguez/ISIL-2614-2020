//
//  PlaceTableViewCell.swift
//  DemoCocoaPods
//
//  Created by Kenyi Rodriguez on 11/5/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

protocol PlaceTableViewCellDelegate {
    func placeTableViewCell(_ cell: PlaceTableViewCell, deletePlace objPlace: PlaceBE)
}

class PlaceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgPlace     : UIImageView!
    @IBOutlet weak var lblName      : UILabel!
    @IBOutlet weak var lblAddress   : UILabel!
    @IBOutlet weak var btnDelete    : UIButton!
    
    var delegate: PlaceTableViewCellDelegate?
    
    var objPlace: PlaceBE! {
        didSet {
            self.updateData()
        }
    }
    
    @IBAction func clickBtnDelete(_ sender: Any) {
        self.delegate?.placeTableViewCell(self, deletePlace: self.objPlace)
    }
    
    private func updateData() {
        
        self.lblName.text       = self.objPlace.place_name
        self.lblAddress.text    = self.objPlace.place_address
        
        self.imgPlace.downloadImageInUrlString(self.objPlace.place_urlImage) { (image, urlString) in
            
            if self.objPlace.place_urlImage == urlString {
                self.imgPlace.image = image
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        self.imgPlace.layer.cornerRadius = 20
        
        self.btnDelete.layer.shadowColor = UIColor.red.cgColor
        self.btnDelete.layer.shadowOffset = .zero
        self.btnDelete.layer.shadowRadius = 5
        self.btnDelete.layer.shadowOpacity = 0.6
    }
}
