//
//  Quote.swift
//  QuotePro
//
//  Created by Larry Luk on 2017-12-06.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

import UIKit

class QuoteAPI {
    
    static func fetchQuoteRequest(_ completion: @escaping ([String: Any]) -> Void) {

        let url = URL(string: "https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")
        let task = URLSession.shared.dataTask(with: url!) { (data, resp, err) in
            if let data = data {
                
                
                guard let parsed = try? JSONSerialization.jsonObject(with: data), let json = parsed as? [String: Any] else {
                        print("Invalid dataset")
                        return
                }
                
                completion(json)
                
            }
            
        }
        task.resume()
        
    }
    
}
