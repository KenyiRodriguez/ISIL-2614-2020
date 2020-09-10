//
//  BoxView.swift
//  DemoDelegadosParte2
//
//  Created by Kenyi Rodriguez on 9/10/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

protocol BoxViewDelegate {
    func boxViewTapInView(_ view: BoxView)
}

class BoxView: UIView {
    
    var delegate: BoxViewDelegate?
    
    func changeRandomBackgroundColor() {
        
        let r = CGFloat.random(in: 0...255) / 255
        let g = CGFloat.random(in: 0...255) / 255
        let b = CGFloat.random(in: 0...255) / 255
        
        let color = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        self.backgroundColor = color
    }
    
    func changeRandomCenter() {
        
        let width = self.superview?.frame.width ?? 0.0
        let height = self.superview?.frame.height ?? 0.0
        
        let posx = CGFloat.random(in: 0...width)
        let posy = CGFloat.random(in: 0...height)
    
        let point = CGPoint(x: posx, y: posy)
        
        self.center = point
    }
    
    func changeAngleRotation() {
        self.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    }

    @objc func tapGestureInView() {
        self.delegate?.boxViewTapInView(self)
    }
    
    override func draw(_ rect: CGRect) {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGestureInView))
        self.addGestureRecognizer(tapGesture)
    }

    override func layoutSubviews() {
        self.changeRandomBackgroundColor()
    }
}
