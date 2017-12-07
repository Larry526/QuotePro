//
//  Quote.swift
//  QuotePro
//
//  Created by Larry Luk on 2017-12-06.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

import UIKit

class Quote: NSObject {
    
    var quote: String!
    var author: String!
    var image: UIImage?
    
    init(quote : String?, author: String?, image: UIImage? = nil ) {
        self.quote = quote
        self.author = author
        self.image = image
    }
    
    convenience init?(dict: [String: Any]) {
        guard let quote = dict["quoteText"] as? String, let author = dict["quoteAuthor"] as? String else {
            return nil
        }
        self.init(quote: quote, author: author)
    }
    
}
