//
//  UIImageView+Extension.swift
//  MVVM+Practice
//
//  Created by Murtaza Mehmood on 28/01/2023.
//

import UIKit


extension UIImageView {
    
    
    /// Download image from server and rendered on device without using catche memory.
    /// - Parameters:
    ///   - url: String url of image
    ///   - placeholder: string name of assets image.
    func downloadImage(image url: String,placeholder: String?) {
        
        //CONVERT STRING INTO URL
        //IF URL FAIL THEN IMAGEVIEW WILL DISPLAY PLACEHOLDER IMAGE OR BLANK
        guard let url = URL(string: url) else {
            self.image = placeholder == nil ? UIImage() : UIImage(named: placeholder!)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil {

                guard let imageData = data else {
                    self.image = placeholder == nil ? UIImage() : UIImage(named: placeholder!)
                    return
                }
                
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            } else {
                self.image = placeholder == nil ? UIImage() : UIImage(named: placeholder!)
            }
        }.resume()
    }
    
}
