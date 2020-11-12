//
//  ImageDownloaded.swift
//  DescargaDeImagenes
//
//  Created by Kenyi Rodriguez on 11/12/20.
//  Copyright © 2020 Kenyi Rodriguez. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func downloadImageInUrlString(_ urlString: String) {
        
        guard let url = URL(string: urlString) else {
            print("URL INVÁLIDA")
            return
        }
        
        var imageDownloaded: UIImage?
        
        DispatchQueue.global(qos: .default).async {
            
            do {
                let dataImage = try Data(contentsOf: url)
                imageDownloaded = UIImage(data: dataImage)
            }catch {
                print("Error al descargar la imagen")
            }
            
            DispatchQueue.main.async {
                self.image = imageDownloaded
            }
        }
    }
}
