//
//  ImageAPI.swift
//  QuotePro
//
//  Created by Larry Luk on 2017-12-06.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

import UIKit

class ImageAPI: NSObject {

    static func fetchImageRequest(_ completion: @escaping (UIImage) -> Void) {
        
        let url = URL(string: "https://lorempixel.com/400/450/")
        let task = URLSession.shared.dataTask(with: url!) { (data, resp, err) in
            if let data = data {
                guard let tempImage = UIImage(data:data) else {
                    print("Invalid data")
                    return
                }
                
                completion(tempImage)
                
            }
            
        }
        task.resume()
        
    }
    
}
