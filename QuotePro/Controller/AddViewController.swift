//
//  AddViewController.swift
//  QuotePro
//
//  Created by Larry Luk on 2017-12-06.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageAPI.fetchImageRequest { image in
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    
        
        QuoteAPI.fetchQuoteRequest { dict in
            let quote = Quote(dict: dict)
            
            DispatchQueue.main.async() {
                self.quoteLabel.text = quote?.quote
                self.authorLabel.text = quote?.author
            }
        }
        

    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func quoteBtnPressed(_ sender: UIButton) {
        QuoteAPI.fetchQuoteRequest { (dict: [String: Any]) in
            let quote = Quote(dict: dict)
            
            DispatchQueue.main.async() {
                self.quoteLabel.text = quote?.quote
                self.authorLabel.text = quote?.author
            }
        }
    }
    
    @IBAction func imageBtnPressed(_ sender: UIButton) {
        ImageAPI.fetchImageRequest { image in
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }

    
}
