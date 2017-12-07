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
    
    var quote: Quote! {
        didSet {
            DispatchQueue.main.async() {
                self.quoteLabel.text = self.quote.quote
                self.authorLabel.text = self.quote.author
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        QuoteAPI.fetchQuoteRequest { (dict: [String: Any]) in
            guard let quote = Quote(dict: dict) else { return }
            self.quote = quote
        }
        
        ImageAPI.fetchImageRequest { image in
            
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }

    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func quoteBtnPressed(_ sender: UIButton) {
        QuoteAPI.fetchQuoteRequest { (dict: [String: Any]) in
            guard let quote = Quote(dict: dict) else { return }
            self.quote = quote
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
