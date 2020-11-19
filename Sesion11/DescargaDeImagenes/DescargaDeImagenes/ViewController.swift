//
//  ViewController.swift
//  DescargaDeImagenes
//
//  Created by Kenyi Rodriguez on 11/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgBand1: UIImageView!
    @IBOutlet weak var imgBand2: UIImageView!
    @IBOutlet weak var imgBand3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgBand1.downloadImageInUrlString("https://cloudfront-us-east-1.images.arcpublishing.com/infobae/ECCMFW4J5ZFMJJDVJULX5OSYQI.jpg")
        self.imgBand2.downloadImageInUrlString("https://i.redd.it/lpf0u9nbj7w41.jpg")
        self.imgBand3.downloadImageInUrlString("https://i.pinimg.com/originals/82/8d/af/828dafb7cb96c58d7b70abf4b74e2f9d.jpg")
    }
}

